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
    final manageJobPostMergedModels =
        ref.watch(manageJobPostMergedModelProvider);
    return manageJobPostMergedModels.when(data: (_manageJobPostMergedModels) {
      if (_manageJobPostMergedModels != null &&
          _manageJobPostMergedModels.isNotEmpty) {
        final jobModels = _manageJobPostMergedModels.map((e) => e.jobModel);
        final applicantModels =
            _manageJobPostMergedModels.map((e) => e.applicantModel);
        final applicationModels =
            _manageJobPostMergedModels.map((e) => e.applicationModel);
        return ExpansionPanelList(
          children: jobModels.map<ExpansionPanel>((e) {
            final innerModels = applicationModels.map(
              (innerAplicationModel) {
                if (innerAplicationModel.jobId == e.jobId) {
                  return MergedManageJobPostInnerModel(
                      applicationModel: innerAplicationModel,
                      applicantModel: applicantModels.firstWhere((element) =>
                          element.uid == innerAplicationModel.uid));
                } // else yok o yuzden null olabilir
              },
            ).toList();

            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ManageCard(jobModel: e);
                },
                body: ListView(
                    children: innerModels.map<Widget>((e) {
                  return Row(
                    children: [
                      ProfileBoxStatic(userModel: e.applicantModel, height: height, width: width)
                      Text("")
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
