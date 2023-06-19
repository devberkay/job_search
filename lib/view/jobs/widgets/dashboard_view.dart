import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/jobs/widgets/job_card.dart';

import 'package:JobSearch/view/jobs/widgets/sort_dropdown_button.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends HookConsumerWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsNotifier = ref.watch(jobNotifierProvider);
    return Padding(
        padding: const EdgeInsets.all(50),
        child: jobsNotifier.when(data: (jobs) {
          if (jobs != null) {
            debugPrint("Everything is ok");
            return ListView.builder(itemBuilder: (context, index) {
              return JobCard(jobModel: jobs[index]);
            });
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.question_mark), Text("No jobs found")],
            );
          }
        }, error: (e, st) {
          debugPrint("dashboard_view.dart error: $e");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error),
              SizedBox(height: 10),
              const Text(
                  "We are facing an issue right now. Please try again later"),
              SizedBox(height: 20),
              FilledCupertinoButton(
                  onPressed: () {
                    ref.refresh(jobNotifierProvider);
                  },
                  height: 35,
                  width: 70,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(2.5),
                  child: const Text("Retry",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)))
            ],
          );
        }, loading: () {
          return const Center(
            child: SpinKitRing(
              color: Colors.black,
            ),
          );
        }));
  }
}
