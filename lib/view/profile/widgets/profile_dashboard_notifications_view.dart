import 'package:JobSearch/model/data/application_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardNotificationsView extends HookConsumerWidget {
  const ProfileDashboardNotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);
    return TabBar(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        controller: controller,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        overlayColor:
            MaterialStatePropertyAll(Colors.grey.shade300.withOpacity(0.25)),
        dividerColor: Colors.black,
        indicatorColor: Colors.black,
        tabs: const [
          Tab(
              text: "Incoming",
              icon: Icon(
                Icons.arrow_downward,
                color: Colors.black,
              )),
          Tab(text: "Outgoing", icon: Icon(Icons.arrow_upward))
        ]);
  }
}
