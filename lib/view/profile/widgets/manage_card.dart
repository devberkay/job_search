import 'package:JobSearch/model/data/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageCard extends HookConsumerWidget {
  const ManageCard({super.key,required this.jobModel});
  final JobModel jobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const companyEmoji = '\u{1F3E2}'; // display if on-site
    const locationEmoji = '\u{1F4CD}';
    const computerEmoji = '\u{1F4BB}'; // display if remote
    
    final isHovering = useState(false);
    return MouseRegion(
      onEnter: (event) {
        isHovering.value = true;
      },
      onExit: (event) {
        isHovering.value = false;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 75,
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(
                      isHovering.value ? -1 : 0, isHovering.value ? -1 : 0),
                  blurRadius: isHovering.value ? 1.25 : 0,
                  spreadRadius: isHovering.value ? 1.25 : 0),
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(
                      isHovering.value ? 1 : 0, isHovering.value ? 1 : 0),
                  blurRadius: isHovering.value ? 1.25 : 0,
                  spreadRadius: isHovering.value ? 1.25 : 0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(jobModel.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 12)),
            const SizedBox(height: 5),
            Text("$companyEmoji ${jobModel.organization}",
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 10)),
            const SizedBox(height: 5),
            Text(
                "${jobModel.isRemote ? computerEmoji : locationEmoji} ${jobModel.isRemote ? 'In-office' : 'Remote available'}",
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
