import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/data/merged_manage_job_post_inner_model.dart';
import 'package:JobSearch/model/service/firestore/manage_job_post_service.dart';
import 'package:JobSearch/view/profile/widgets/manage_card.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                    children: [
                      ProfileBoxStatic(
                          userModel: mergedInnerModel.applicantModel,
                          height: 36,
                          width: 108),
                      const Text(
                          "has applied to following job published by you"),
                      const SizedBox(width: 5),
                      Chip(
                        backgroundColor: Colors.grey.shade100,
                        label: Text(
                          jobModel.title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
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
        return const Center(
          child: Text("You have not posted any job yet"),
        );
      }
    }, error: (e, st) {
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
