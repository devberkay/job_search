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
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: jobsNotifier.when(data: (jobs) {
          if (jobs != null) {
            debugPrint("dashboard_view.dart: OK");
            return ListView.separated(
                clipBehavior: Clip.none,
                itemCount: jobs.length + 2,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 50);
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.notifications,
                                color: Colors.blueAccent.shade700),
                            const SizedBox(width: 10),
                            Text("Turn on job alerts for your search",
                                style: TextStyle(
                                    color: Colors.blueAccent.shade700,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(width: 20),
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: FittedBox(
                                child: HookConsumer(
                                    builder: (context, ref, child) {
                                  final isNotificationsActive = useState(false);
                                  return CupertinoSwitch(
                                      value: isNotificationsActive.value,
                                      activeColor: Colors.blueAccent.shade700,
                                      trackColor: Colors.grey.shade400,
                                      onChanged: (value) {
                                        isNotificationsActive.value = value;
                                      });
                                }),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.unfold_more,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 10),
                            const SortDropdownButton(),
                          ],
                        )
                      ],
                    );
                  } else if (index == jobs.length + 1) {
                    return const SizedBox(height: 50);
                  } else {
                    return JobCard(jobModel: jobs[index - 1]);
                  }
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
              const SizedBox(height: 10),
              const Text(
                  "We are facing an issue right now. Please try again later"),
              const SizedBox(height: 20),
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
