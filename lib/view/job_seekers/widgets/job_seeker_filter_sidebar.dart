import 'package:JobSearch/model/service/firestore/seeker_notifier.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
                    ref.invalidate(seekerPositionTitleListProvider);
                    ref.invalidate(seekerSkillsListProvider);
                    
                  })
            ],
          ),
          const SizedBox(height: 15),
          HookConsumer(builder: (context, ref, child) {
            final items = ref.watch(seekerPositionTitleListProvider);
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              children: items.map<Widget>((e) {
                return Chip(
                  label: Text(e),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey.shade400),
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  onDeleted: () {
                    ref.read(seekerPositionTitleListProvider.notifier).remove(e);
                  },
                  deleteButtonTooltipMessage: "Remove filter",
                  deleteIcon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                );
              }).toList(),
            );
          }),
          const SizedBox(height: 15),
          HookConsumer(builder: (context, ref, child) {
            final controller = useTextEditingController();
            ref.watch(seekerPositionTitleListProvider);
            return CupertinoTextField(
              padding: const EdgeInsets.all(15),
              controller: controller,
              placeholder: "Software Engineering, Design, Sales",
              onSubmitted: (value) {
                
                ref
                    .read(seekerPositionTitleListProvider.notifier)
                    .add(value.split(" "));
                controller.clear();
              },
              placeholderStyle: TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w500),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.5),
                        offset: const Offset(0, 1),
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(5)),
            );
          }),
        ],
      ),
    );
  }
}