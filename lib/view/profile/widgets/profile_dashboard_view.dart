import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardView extends HookConsumerWidget {
  const ProfileDashboardView({super.key});

  Widget _buildProfileDashboard(int index) {
    switch (index) {
      case 0:
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            
            children: [
              ProfileAvatar(radius: 75, userId: userId)
            ],
          ),
        );
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
