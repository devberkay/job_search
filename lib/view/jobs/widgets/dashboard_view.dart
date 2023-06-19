import 'package:JobSearch/view/jobs/widgets/job_card.dart';
import 'package:JobSearch/view/jobs/widgets/sort_dropdown_button.dart';
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
                  Icon(
                    Icons.notifications,
                    color: Colors.blueAccent.shade700,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("Turn on job alerts for your search",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent.shade700)),
                  const SizedBox(
                    width: 15,
                  ),
                  HookConsumer(builder: (context, ref, child) {
                    final isNotificationsActive = useState(
                        false); // later to be replaced with a isar call
                    return SizedBox(
                      height: 40,
                      width: 40,
                      child: FittedBox(
                        child: CupertinoSwitch(
                            trackColor: Colors.grey.shade400,
                            activeColor: Colors.blueAccent.shade700,
                            value: isNotificationsActive.value,
                            onChanged: (value) {
                              isNotificationsActive.value = value;
                            }),
                      ),
                    );
                  })
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
                  const SizedBox(width: 5),
                  const SortDropdownButton(),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          JobCard()
        ],
      ),
    );
  }
}
