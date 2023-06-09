import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/data/merged_manage_job_post_inner_model.dart';
import 'package:JobSearch/model/service/firestore/application_status_change_service.dart';
import 'package:JobSearch/model/service/firestore/manage_job_post_service.dart';
import 'package:JobSearch/view/jobs/widgets/job_card.dart';
import 'package:JobSearch/view/profile/widgets/manage_card.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class ProfileDashboardManageJobPostsView extends HookConsumerWidget {
  const ProfileDashboardManageJobPostsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manageJobPostMergedModel =
        ref.watch(manageJobPostMergedModelProvider);
    return manageJobPostMergedModel.when(data: (_manageJobPostMergedModel) {
      debugPrint(
          "Hello brother-1 : ${_manageJobPostMergedModel.applicantModels.toString()}");
      debugPrint(
          "Hello brother-2 : ${_manageJobPostMergedModel.applicationModels.toString()}");
      debugPrint(
          "Hello brother-3 : ${_manageJobPostMergedModel.jobModels.toString()}");
      if (_manageJobPostMergedModel.applicantModels.isNotEmpty &&
          _manageJobPostMergedModel.applicationModels.isNotEmpty &&
          _manageJobPostMergedModel.jobModels.isNotEmpty) {
        var listOfWidgets = <Widget>[];
        final jobModels = _manageJobPostMergedModel.jobModels;
        final applicantModels = _manageJobPostMergedModel.applicantModels;
        final applicationModels = _manageJobPostMergedModel.applicationModels;
        ExpansionPanel buildExpansionPanel(
            JobModel jobModel, int index, ValueNotifier<int?> selectedIndex) {
          final relevantApplicationModels = applicationModels
              .where((element) => element.jobId == jobModel.jobId);
          final innerModels =
              relevantApplicationModels.map((innerAplicationModel) {
            return MergedManageJobPostInnerModel(
                applicationModel: innerAplicationModel,
                applicantModel: applicantModels.firstWhere(
                    (element) => element.uid == innerAplicationModel.uid));
          }).toList();
          listOfWidgets =
              innerModels.mapIndexed<Widget>((index, mergedInnerModel) {
            return Column(
              children: [
                DecoratedBox(
                  decoration: const ShapeDecoration(
                      shape:
                          StadiumBorder(side: BorderSide(color: Colors.black))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileBoxStatic(
                          userModel: mergedInnerModel.applicantModel,
                          height: 40,
                          width: 120),
                      const Text(
                        "has applied to following job published by you",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 5),
                      HeadlessCupertinoButton(
                        onPressed: () {
                          ref.read(selectedJobModelProvider.notifier).state =
                              jobModel;
                          context.goNamed('jobsExtraRoute');
                        },
                        child: Chip(
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.black)),
                          backgroundColor: Colors.grey.shade200,
                          label: Text(
                            jobModel.title,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      HeadlessCupertinoButton(
                        onPressed: () {
                          ref
                              .read(applicationStatusChangeServiceProvider
                                  .notifier)
                              .acceptApplication(
                                  mergedInnerModel.applicationModel);
                        },
                        child: const DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            child: Icon(Icons.check, color: Colors.white)),
                      ),
                      const SizedBox(width: 5),
                      HeadlessCupertinoButton(
                        onPressed: () {
                          ref
                              .read(applicationStatusChangeServiceProvider
                                  .notifier)
                              .rejectApplication(
                                  mergedInnerModel.applicationModel);
                        },
                        child: const DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Icon(Icons.remove, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            );
          }).toList();
          return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ManageCard(jobModel: jobModel);
              },
              isExpanded: index == selectedIndex.value,
              canTapOnHeader: true,
              body: SizedBox(
                  height: 250, child: ListView(children: listOfWidgets)));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: HookConsumer(builder: (context, ref, child) {
                final selectedIndex = useState<int?>(null);
                return ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    if (!isExpanded) {
                      selectedIndex.value = panelIndex;
                    } else {
                      if (panelIndex == selectedIndex.value) {
                        selectedIndex.value = null;
                      }
                    }
                  },
                  children: jobModels.mapIndexed((index, e) {
                    return buildExpansionPanel(e, index, selectedIndex);
                  }).toList(),
                );
              }),
            ),
          ),
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
              "You have not posted any job yet or already answered all the applications",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }
    }, error: (e, st) {
      debugPrint("profile_dashboard_manage_job_posts_view_error : $e");
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
