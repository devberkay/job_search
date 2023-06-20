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
            color: Colors.grey.shade100.withOpacity(0.25),
            border: Border(right: BorderSide(color: Colors.grey.shade400))),
        child: Column(
          children: [
            HookConsumer(builder: (context, ref, child) {
              final isSelected =
                  ref.watch(sidebarIndexProvider.select((value) => value == 0));
              return FilledCupertinoButton(
                  onPressed: () {
                    ref.read(sidebarIndexProvider.notifier).state = 0;
                  },
                  height: 75,
                  border: Border.all(color: Colors.black),
                  width: double.maxFinite,
                  fillColor: isSelected ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(7.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit,
                          color: isSelected ? Colors.white : Colors.black),
                      SizedBox(width: 5),
                      Text("Edit profile",
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black))
                    ],
                  ));
            }),
            SizedBox(height: 30),
            HookConsumer(builder: (context, ref, child) {
              final isSelected =
                  ref.watch(sidebarIndexProvider.select((value) => value == 1));
              return FilledCupertinoButton(
                  onPressed: () {
                    ref.read(sidebarIndexProvider.notifier).state = 1;
                  },
                  height: 75,
                  width: double.maxFinite,
                  border: Border.all(color: Colors.black),
                  fillColor: isSelected ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(7.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications,
                          color: isSelected ? Colors.white : Colors.black),
                      SizedBox(width: 5),
                      Text("Notifications",
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black))
                    ],
                  ));
            }),
            SizedBox(height: 30),
            HookConsumer(builder: (context, ref, child) {
              final isSelected =
                  ref.watch(sidebarIndexProvider.select((value) => value == 2));
              return FilledCupertinoButton(
                  onPressed: () {
                    ref.read(sidebarIndexProvider.notifier).state = 2;
                  },
                  height: 75,
                  border: Border.all(color: Colors.black),
                  width: double.maxFinite,
                  fillColor: isSelected ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(7.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.present_to_all_sharp,
                          color: isSelected ? Colors.white : Colors.black),
                      SizedBox(width: 5),
                      Text("My applications",
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black))
                    ],
                  ));
            }),
            SizedBox(height: 30),
            HookConsumer(builder: (context, ref, child) {
              final isSelected =
                  ref.watch(sidebarIndexProvider.select((value) => value == 3));
              return FilledCupertinoButton(
                  onPressed: () {
                    ref.read(sidebarIndexProvider.notifier).state = 3;
                  },
                  height: 75,
                  border: Border.all(color: Colors.black),
                  width: double.maxFinite,
                  fillColor: isSelected ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(7.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_box_sharp,
                          color: isSelected ? Colors.white : Colors.black),
                      SizedBox(width: 5),
                      Text("Create job post",
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black))
                    ],
                  ));
            })
          ],
        ));
  }
}