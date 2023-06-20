import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sidebarIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class ProfileSidebar extends HookConsumerWidget {
  const ProfileSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.grey.shade400))),
      child:Column(
        children: [
          HookConsumer(
            builder: (context,ref,child) {
              return FilledCupertinoButton(child: Row(
                children: [Icon(Icons.add),SizedBox(width: 5),Text("Create job post")],
              ), onPressed: () {}, height: 100, width: double.maxFinite, fillColor: Colors.white, borderRadius: BorderRadius.circular(10));
            }
          )
        ],
      )
    );
  }
}