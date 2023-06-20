import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/jobs/widgets/filter_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobsPage extends StatefulHookConsumerWidget {
  const JobsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _JobsPageState();
}

class _JobsPageState extends ConsumerState<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [FilterSidebar(), Expanded(child: DashboardView())],
      ),
    );
  }
}
