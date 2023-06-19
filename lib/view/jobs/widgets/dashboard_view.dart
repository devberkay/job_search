import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/jobs/widgets/job_card.dart';
import 'package:JobSearch/view/jobs/widgets/job_list_view.dart';
import 'package:JobSearch/view/jobs/widgets/sort_dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends HookConsumerWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsNotifier = ref.watch(jobNotifierProvider);
    return Padding(
        padding: const EdgeInsets.all(50),
        child: jobsNotifier.when(
            data: (jobs) {
              if(jobs!=null) {
                ListView.builder(itemBuilder: (context, index) {
                return JobCard(jobModel: jobs[index]);
              });
              }
              else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.question_mark),
                    Text("No jobs found")
                  ],
                );
              }
            },
            error: (e, st) {

            },
            loading: () {

            }));
  }
}
