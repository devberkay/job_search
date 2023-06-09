import 'package:JobSearch/view/job_seekers/widgets/job_seeker_dashboard_view.dart';
import 'package:JobSearch/view/job_seekers/widgets/job_seeker_filter_sidebar.dart';
import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/jobs/widgets/filter_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobSeekersPage extends StatefulHookConsumerWidget {
  const JobSeekersPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobSeekersPageState();
}

class _JobSeekersPageState extends ConsumerState<JobSeekersPage> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [JobSeekerFilterSidebar(), Expanded(child: JobSeekerDashboardView())],
    );
  }
}
