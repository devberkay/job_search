
import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/profile/widgets/profile_dashboard_view.dart';
import 'package:JobSearch/view/profile/widgets/profile_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    
    return  Row(
      children: [ProfileSidebar(), Expanded(child: HookConsumer(
        builder: (context,ref,child) {
          
          return ProfileDashboardView();
        }
      ))],
    );
  }
}
