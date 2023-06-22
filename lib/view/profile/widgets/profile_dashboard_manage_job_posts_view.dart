import 'package:JobSearch/model/data/merged_manage_job_post_inner_model.dart';
import 'package:JobSearch/model/service/firestore/manage_job_post_service.dart';
import 'package:JobSearch/view/profile/widgets/manage_card.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final expansionPanelIndexProvider = StateProvider<int?>((ref) {
  return null;
});

class ProfileDashboardManageJobPostsView extends HookConsumerWidget {
  const ProfileDashboardManageJobPostsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const companyEmoji = '\u{1F3E2}'; // display if on-site
    const locationEmoji = '\u{1F4CD}';
    const computerEmoji = '\u{1F4BB}'; // display if remote
    const moneyEmoji = '\u{1F4B5}';
    const applicantsEmoji = '\u{1F464}';
    final manageJobPostMergedModel =
        ref.watch(manageJobPostMergedModelProvider);
    return manageJobPostMergedModel.when(data: (_manageJobPostMergedModel) {
      if (_manageJobPostMergedModel.applicantModels.isNotEmpty &&
          _manageJobPostMergedModel.applicationModels.isNotEmpty &&
          _manageJobPostMergedModel.jobModels.isNotEmpty) {
        final jobModels = _manageJobPostMergedModel.jobModels;
        final applicantModels = _manageJobPostMergedModel.applicantModels;
        final applicationModels = _manageJobPostMergedModel.applicationModels;
        return ExpansionPanelList(
          children: jobModels.map<ExpansionPanel>((e) {
            final innerModels = applicationModels.map((innerAplicationModel) {
              return MergedManageJobPostInnerModel(
                  applicationModel: applicationModels
                      .firstWhere((element) => element.jobId == e.jobId),
                  applicantModel: applicantModels.firstWhere(
                      (element) => element.uid == innerAplicationModel.uid));
            }).toList();

            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ManageCard(jobModel: e);
                },
                body: ListView(
                    children: innerModels.map<Widget>((mergedInnerModel) {
                  return Row(
                    children: [
                      ProfileBoxStatic(
                          userModel: mergedInnerModel.applicantModel,
                          height: 12,
                          width: 36),
                      Text("has applied to following job published by you"),
                      Chip(
                          label: Text(
                        e.title,
                        style: TextStyle(color: Colors.black),
                      ))
                    ],
                  );
                }).toList()));
          }).toList(),
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
