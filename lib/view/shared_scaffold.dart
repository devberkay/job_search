import 'package:JobSearch/model/provider/auth/auth_stream_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/service/firestore/application_service.dart';
import 'package:JobSearch/model/service/firestore/application_status_change_service.dart';
import 'package:JobSearch/model/service/firestore/offer_service.dart';
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
    ref.listen(offerServiceNotifierProvider, (previous, next) {
      next.whenData((value) {
        if(value == "JOB_OFFER_SENT") {
          context.showSuccesFlashbar("Job offer sent");
        } else if(value == "JOB_OFFER_ACCEPTED") {
          context.showSuccesFlashbar("Job offer accepted");
        } else if(value == "JOB_OFFER_REJECTED") {
          context.showErrorFlushbar("Job offer rejected");
        }
        else if(value == "CYCLIC_JOB_OFFER") {
          context.showErrorFlushbar("You cannot send a job offer to yourself");
        }
      });
    });
    ref.listen(applicationStatusChangeServiceProvider, (previous, next) {
      next.whenData((value) {
        if (value == "ACCEPTED") {
          context.showSuccesFlashbar("Job application has been accepted");
        } else if (value == "REJECTED") {
          context.showErrorFlushbar("Job application has been rejected");
        }
      });
    });
    ref.listen(applicationServiceProvider, (previous, next) {
      next.whenData((value) {
        if (value == "ALREADY_APPLIED") {
          context.showErrorFlushbar("You've already applied to this job.");
        } else if (value == "SUCCESS") {
          context
              .showSuccesFlashbar("You've successfully applied to this job.");
        }
        else if(value == "CANNOT_APPLY_TO_OWN_JOB") {
          context.showErrorFlushbar("You cannot apply to your own job.");
        }
      });
    });
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
