import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/profile/widgets/profile_dashboard_create_job_post_view.dart';
import 'package:JobSearch/view/profile/widgets/profile_dashboard_profile_view.dart';
import 'package:JobSearch/view/profile/widgets/profile_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/profile_dashboard_manage_job_posts_view.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key, required this.userId});
  final String? userId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profileSidebarIndex = ref.watch(profileSidebarIndexProvider);
    final currentUser = ref.watch(userProvider);
    return Row(
      children: currentUser?.uid != widget.userId ? [
        const ProfileSidebar(),
        Expanded(child: HookConsumer(builder: (context, ref, child) {
          if (profileSidebarIndex == 0) {
            final userModel = ref.watch(userModelProvider(widget.userId));
            return userModel.when(
                // ignore: no_leading_underscores_for_local_identifiers
                data: (_userModel) {
              if (_userModel != null) {
                return ProfileDashboardProfileView(userModel: _userModel);
              } else {
                return const Column(
                  children: [
                    Icon(Icons.question_mark, color: Colors.black),
                    SizedBox(
                      height: 25,
                    ),
                    Text("User not found",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ],
                );
              }
            }, error: (e, st) {
              return const Column(
                children: [
                  Icon(Icons.error, color: Colors.black),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Error loading user",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              );
            }, loading: () {
              return const Center(
                child: SpinKitRing(
                  color: Colors.black,
                ),
              );
            });
          } else if (profileSidebarIndex == 1) {
            return Container();
          } else if (profileSidebarIndex == 2) {
            return Container();
          } else if (profileSidebarIndex == 3) {
            return ProfileDashboardManageJobPostsView();
          } else if (profileSidebarIndex == 4) {
            return ProfileDashboardCreateJobPostView();
          } else {
            final userModel = ref.watch(userModelProvider(widget.userId));
            return userModel.when(
                // ignore: no_leading_underscores_for_local_identifiers
                data: (_userModel) {
              if (_userModel != null) {
                return ProfileDashboardProfileView(userModel: _userModel);
              } else {
                return const Column(
                  children: [
                    Icon(Icons.question_mark, color: Colors.black),
                    SizedBox(
                      height: 25,
                    ),
                    Text("User not found",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ],
                );
              }
            }, error: (e, st) {
              return const Column(
                children: [
                  Icon(Icons.error, color: Colors.black),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Error loading user",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              );
            }, loading: () {
              return const Center(
                child: SpinKitRing(
                  color: Colors.black,
                ),
              );
            });
          }
        }))
      ] : [],
    );
  }
}
