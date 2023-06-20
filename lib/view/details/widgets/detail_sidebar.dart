import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
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
        padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        width: 400,
        child: jobModels.whenOrNull(
          data: (data) {
            if (data != null) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(color: Colors.grey.shade300))),
                    child: Row(
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
                                color: Colors.grey.shade400,
                              ),
                              Text("Edit filters",
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15))
                            ],
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20);
                      },
                      itemBuilder: (context, index) {},
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
