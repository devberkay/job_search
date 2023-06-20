import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardView extends HookConsumerWidget {
  const ProfileDashboardView({super.key});

  Widget _buildProfileDashboard(int index) {
    switch (index) {
      case 0:
        return Container();
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
