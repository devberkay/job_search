import 'package:JobSearch/model/data/merged_manage_job_post_inner_model.dart';
import 'package:JobSearch/model/service/firestore/manage_job_post_service.dart';
import 'package:JobSearch/view/profile/widgets/manage_card.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

final expansionPanelIndexProvider = StateProvider<int?>((ref) {
  return null;
});

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
        var innerModels = <MergedManageJobPostInnerModel>[];
        var listOfWidgets = <Widget>[];
        final jobModels = _manageJobPostMergedModel.jobModels;
        final applicantModels = _manageJobPostMergedModel.applicantModels;
        final applicationModels = _manageJobPostMergedModel.applicationModels;
        for (var jobModel in jobModels) {
          innerModels = applicationModels.map((innerAplicationModel) {
            return MergedManageJobPostInnerModel(
                applicationModel: applicationModels
                    .firstWhere((element) => element.jobId == jobModel.jobId),
                applicantModel: applicantModels.firstWhere(
                    (element) => element.uid == innerAplicationModel.uid));
          }).toList();
          listOfWidgets =
              innerModels.mapIndexed<Widget>((index, mergedInnerModel) {
            return Row(
              children: [
                ProfileBoxStatic(
                    userModel: mergedInnerModel.applicantModel,
                    height: 12,
                    width: 36),
                Text("has applied to following job published by you"),
                Chip(
                    label: Text(
                  jobModel.title,
                  style: TextStyle(color: Colors.black),
                ))
              ],
            );
          }).toList();
        }

        return SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              if (isExpanded) {
                ref.read(expansionPanelIndexProvider.notifier).state =
                    panelIndex;
              }
            },
            children: jobModels.mapIndexed<ExpansionPanel>((index,e) {
              return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ManageCard(jobModel: e);
                  },
                  canTapOnHeader: true,
                  body: SizedBox(
                      height: 300, child: ListView(children: listOfWidgets)));
            }).toList(),
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
