import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/jobs/widgets/job_card.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailSidebar extends HookConsumerWidget {
  const DetailSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldPaginateNext = ref.watch(shouldPaginateNextProvider);
    final jobModels = ref.watch(jobNotifierProvider(shouldPaginateNext));
    return Container(
        color: Colors.white,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        width: 400,
        child: jobModels.whenOrNull(
          data: (data) {
            if (data != null) {
              return Column(
                children: [
                  Row(
                    children: [
                      HeadlessCupertinoButton(
                        onPressed: () {
                          context.go("/jobs");
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                              color: Colors.grey.shade500,
                            ),
                            Text("Edit filters",
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemBuilder: (context, index) {
                        return HookConsumer(builder: (context, ref, child) {
                          const companyEmoji =
                              '\u{1F3E2}'; // display if on-site
                          const locationEmoji = '\u{1F4CD}';
                          const computerEmoji =
                              '\u{1F4BB}'; // display if remote
                          final isSelected = ref.watch(
                              selectedJobModelProvider.select((value) =>
                                  value?.jobId == data[index].jobId));
                          final isHovering = useState(false);
                          return MouseRegion(
                            onEnter: (event) {
                              isHovering.value = true;
                            },
                            onExit: (event) {
                              isHovering.value = false;
                            },
                            child: InkWell(
                                onTap: () {
                                  ref
                                      .read(selectedJobModelProvider.notifier)
                                      .state = data[index];
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: 75,
                                  transformAlignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: isSelected
                                              ? Colors.blueAccent.shade700
                                              : Colors.grey.shade300),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            offset: Offset(
                                                isHovering.value ? -1 : 0,
                                                isHovering.value ? -1 : 0),
                                            blurRadius:
                                                isHovering.value ? 1.25 : 0,
                                            spreadRadius:
                                                isHovering.value ? 1.25 : 0),
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            offset: Offset(
                                                isHovering.value ? 1 : 0,
                                                isHovering.value ? 1 : 0),
                                            blurRadius:
                                                isHovering.value ? 1.25 : 0,
                                            spreadRadius:
                                                isHovering.value ? 1.25 : 0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data[index].title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 12)),
                                      const SizedBox(height: 5),
                                      Text(
                                          "$companyEmoji ${data[index].organization}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10)),
                                      const SizedBox(height: 5),
                                      Text(
                                          "${data[index].isRemote ? computerEmoji : locationEmoji} ${data[index].isRemote ? 'In-office' : 'Remote available'}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10)),
                                    ],
                                  ),
                                )),
                          );
                        });
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.question_mark, size: 40),
                  SizedBox(height: 25),
                  Text("No jobs found",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25))
                ],
              );
            }
          },
          loading: () => const Center(
            child: SpinKitRing(
              color: Colors.black,
            ),
          ),
        ));
  }
}
