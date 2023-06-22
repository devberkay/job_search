import 'package:JobSearch/model/service/firestore/user_model_service_notifier.dart';
import 'package:JobSearch/model/service/storage/upload_service.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/view/home/widgets/home_page_appbar.dart';
import 'package:JobSearch/view/profile/widgets/profile_sidebar.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mime/mime.dart';

class SharedScaffold extends StatefulHookConsumerWidget {
  const SharedScaffold(
      {super.key, required this.routerState, required this.child});
  final GoRouterState routerState;
  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends ConsumerState<SharedScaffold> {
  @override
  Widget build(BuildContext context) {
    ref.listen(uploadServiceProvider, (previous, next) {
      next.when(data: (fileType) {
        context.loaderOverlay.hide();
        if (fileType == "picture") {
          context.showSuccesFlashbar("Profile picture updated successfully");
        } else if (fileType == "file") {
          context.showSuccesFlashbar("File uploaded successfully");
        }
      }, error: (e, st) {
        debugPrint("error_type: ${e.runtimeType}");
        context.loaderOverlay.hide();
        context.showErrorFlushbar(e.toString());
      }, loading: () {
        context.loaderOverlay.show();
      });
    });
    ref.listen(userModelServiceProvider, (prev, next) {
      next.whenData((value) {
        context.showSuccesFlashbar("Profile updated successfully");
      });
    });
    return SafeArea(
      child: Scaffold(
        floatingActionButton: widget.routerState.location.contains('profile') &&
                ref.watch(profileSidebarIndexProvider) == 0
            ? FloatingActionButton(
                onPressed: () async {
                  try {
                    final pickedFile = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    if (pickedFile != null && pickedFile.files.isNotEmpty) {
                      await ref.read(uploadServiceProvider.notifier).uploadFile(
                          cvFile: pickedFile.files.first.bytes!,
                          userId: widget.routerState.pathParameters['userId']!,
                          settableMetadata: SettableMetadata(
                              contentType: lookupMimeType(
                                  pickedFile.files.first.extension!),
                              customMetadata: {
                                "name": pickedFile.files.first.name
                              }));
                    }
                  } catch (e) {
                    debugPrint("heyerror :$e");
                    context.showErrorFlushbar("File could not be selected");
                  }
                },
                child: HookConsumer(builder: (context, ref, child) {
                  final opacityNotifier = useValueNotifier(0.0);
                  return MouseRegion(
                      onExit: (event) {
                        opacityNotifier.value = 0.0;
                      },
                      onEnter: (event) {
                        opacityNotifier.value = 1.0;
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("CV",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 75 / 4,
                                        fontWeight: FontWeight.w900)),
                                Icon(Icons.download,
                                    color: Colors.black, size: 75 / 4)
                              ],
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: opacityNotifier,
                              builder: (context, opacity, child) {
                                return AnimatedOpacity(
                                    opacity: opacity,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 250),
                                    child: Container(
                                        width: 150,
                                        height: 150,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.white,
                                          size: 75 / 2,
                                        )));
                              }),
                        ],
                      ));
                }),
              )
            : null,
        appBar: const HomePageAppBar(
          customPreferredSize: Size(double.infinity, 60),
        ),
        // widget.routerState.location == "/"
        //     ? const HomePageAppBar(
        //         customPreferredSize: Size(double.infinity, 60),
        //       )
        //     : null,
        drawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: false,
        body: widget.child,
      ),
    );
  }
}
