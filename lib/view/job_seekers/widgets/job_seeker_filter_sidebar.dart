import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobSeekerFilterSidebar extends HookConsumerWidget {
  const JobSeekerFilterSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.grey.shade400))),
      child: ListView(
        children: [
          Row(
            children: [
              const Text("Enter a qualification or skill",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const Spacer(),
              HeadlessCupertinoButton(
                  child: Text("Clear filters",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent.shade700)),
                  onPressed: () {
                    ref.invalidate(whatDoYouWantToDoListProvider);
                    ref.invalidate(skillsListProvider);
                    ref.invalidate(degreesSetProvider);
                    ref.invalidate(jobTypesSetProvider);
                    ref.invalidate(isRemoteEligibleProvider);
                  })
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}