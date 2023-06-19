import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends HookConsumerWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications, color: Colors.blueAccent.shade700),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("Turn on job alerts for your search",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent.shade700)),
                  const SizedBox(
                    width: 5,
                  ),
                  HookConsumer(builder: (context, ref, child) {
                    final isNotificationsActive = useState(
                        false); // later to be replaced with a isar call
                    return CupertinoSwitch(
                        trackColor: Colors.grey.shade400,
                        activeColor: Colors.blueAccent.shade700,
                        value: isNotificationsActive.value,
                        onChanged: (value) {
                          isNotificationsActive.value = value;
                        });
                  })
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
