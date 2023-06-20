import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/jobs/widgets/dashboard_view.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailSidebar extends HookConsumerWidget {
  const DetailSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldPaginateNext = ref.watch(shouldPaginateNextProvider);
    final jobModels = ref.watch(jobNotifierProvider(shouldPaginateNext)).asData!.value;
    return Container(
      color: Colors.white,
      height: double.infinity,
      padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      width: 400,
      child: jobModels != null ? Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300))
            ),
            child: Row(
              children: [
                HeadlessCupertinoButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.arrow_back_ios_new_rounded, size: 16), Text("Edit filters",style: TextStyle(color: Colors.grey.shade400))],
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
            itemCount: jobModels.length,
            separatorBuilder: (context, index) {
              
            },
            itemBuilder: (context, index) {},

          ),
        ],
      ) : null,
    );
  }
}
