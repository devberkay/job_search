import 'package:JobSearch/view/details/widgets/detail_card.dart';
import 'package:JobSearch/view/details/widgets/detail_sidebar.dart';
import 'package:JobSearch/view/jobs/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedJobModel = ref.watch(selectedJobModelProvider)!;
    return Container(
      color: Colors.grey.shade100.withOpacity(0.5),
      child: Row(
        children: [
          const DetailSidebar(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30.0, top: 30.0),
            child: DetailCard(jobModel: selectedJobModel),
          ))
        ],
      ),
    );
  }
}
