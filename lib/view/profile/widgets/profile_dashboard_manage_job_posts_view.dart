import 'package:JobSearch/model/service/firestore/manage_job_post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardManageJobPostsView extends HookConsumerWidget {
  const ProfileDashboardManageJobPostsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manageJobPostMergedModels =
        ref.watch(manageJobPostMergedModelProvider);
    return manageJobPostMergedModels.when(data: (_manageJobPostMergedModels) {
      if(_manageJobPostMergedModels!=null) {
        final jobModels = _manageJobPostMergedModels.map((e) => e.jobModel);
      return ListView.separated(
          itemCount: _manageJobPostMergedModels.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 30);
          },
          itemBuilder: ((context, index) {
            jobModels.map((e) => null)
          }));

      }
      else {
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
