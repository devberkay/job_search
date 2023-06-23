import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/service/firestore/my_applications_service.dart';
import 'package:JobSearch/view/jobs/widgets/job_card.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardMyApplicationsView extends HookConsumerWidget {
  const ProfileDashboardMyApplicationsView({
    super.key,
  });

  String textBuilder(bool? applicationStatus) {
    if (applicationStatus == null) {
      return "Application is pending";
    } else if (applicationStatus == true) {
      return "Application is accepted";
    } else {
      return "Application is rejected";
    }
  }

  Color colorBuilder(bool? applicationStatus) {
    if (applicationStatus == null) {
      return Colors.grey;
    } else if (applicationStatus == true) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myApplications = ref.watch(myApplicationsStreamProvider);
    final userModel = ref
        .watch(userModelProvider(ref.watch(userProvider)!.uid))
        .asData!
        .value!;
    return myApplications.when(data: (mergedModel) {
      if (mergedModel.isNotEmpty) {
        debugPrint("WHY!! : $mergedModel");
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          itemCount: mergedModel.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(side: BorderSide(color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileBoxStatic(
                      userModel: userModel, height: 40, width: 120),
                  const Text(
                    "have applied the following job",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 10),
                  HeadlessCupertinoButton(
                    onPressed: () {
                      ref.read(selectedJobModelProvider.notifier).state =
                          mergedModel[index].jobModel;
                      context.goNamed('jobsExtraRoute');
                    },
                    child: Chip(
                      shape: const StadiumBorder(
                          side: BorderSide(color: Colors.black)),
                      backgroundColor: Colors.grey.shade200,
                      label: Text(
                        mergedModel[index].jobModel.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Opacity(
                    opacity: mergedModel[index].applicationModel.status == true
                        ? 1
                        : 0.15,
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: Icon(Icons.check, color: Colors.white)),
                  ),
                  const SizedBox(width: 5),
                  Opacity(
                    opacity: mergedModel[index].applicationModel.status == null
                        ? 1
                        : 0.15,
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: Icon(Icons.question_mark, color: Colors.white)),
                  ),
                  const SizedBox(width: 5),
                  Opacity(
                    opacity: mergedModel[index].applicationModel.status == false
                        ? 1
                        : 0.15,
                    child: const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Icon(Icons.remove, color: Colors.white)),
                  ),
                  const SizedBox(width: 5),
                  Text(
                      "( ${textBuilder(mergedModel[index].applicationModel.status)} )",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: colorBuilder(
                              mergedModel[index].applicationModel.status)))
                ],
              ),
            );
          },
        );
      } else {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.question_mark,
              color: Colors.black,
            ),
            SizedBox(height: 5),
            Text(
              "You haven't applied to any job yet",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }
    }, error: (e, st) {
      debugPrint("profile_dashboard_my_applicatons_view.dart error : $e");
      return const Center(
          child: Column(
        children: [
          Icon(Icons.error),
          SizedBox(height: 10),
          Text("We are facing an issue right now. Please try again later"),
        ],
      ));
    }, loading: () {
      return const Center(
        child: SpinKitRing(
          color: Colors.black,
        ),
      );
    });
  }
}
