import 'package:JobSearch/model/provider/auth/auth_stream_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/service/firestore/publish_service.dart';
import 'package:JobSearch/model/service/firestore/user_model_service_notifier.dart';
import 'package:JobSearch/model/service/storage/upload_service.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/view/home/widgets/home_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
    ref.listen(userProvider, (previous, next) {
      if (next == null && widget.routerState.location.contains("profile")) {
        context.go("/");
      }
    });
    ref.listen(publishServiceProvider, (previous, next) {
      next.when(data: (fileType) {
        context.loaderOverlay.hide();
        if (fileType == "OK") {
          context.showSuccesFlashbar("Job posted successfully");
        }
      }, error: (e, st) {
        debugPrint("error_type: ${e.runtimeType}");
        context.loaderOverlay.hide();
        context.showErrorFlushbar(e.toString());
      }, loading: () {
        context.loaderOverlay.show();
      });
    });
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
