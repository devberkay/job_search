import 'package:JobSearch/model/data/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobCard extends HookConsumerWidget {
  const JobCard({super.key, required this.jobModel});
  final JobModel jobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyEmoji = '\u{1F3E2}'; // display if on-site
    final locationEmoji = '\u{1F4CD}';
    final String computerEmoji = '\u{1F4BB}'; // display if remote
    final isHovering = useState(false);
    return MouseRegion(
      onEnter: (event) {
        isHovering.value = true;
      },
      onExit: (event) {
        isHovering.value = false;
      },
      child: InkWell(
          onTap: () {},
          child: AnimatedContainer(
            clipBehavior: Clip.none,
            duration: const Duration(milliseconds: 250),
            transformAlignment: Alignment.center,
            // transform: isHovering.value
            //     ? Matrix4.identity().scaled(1.01)
            //     : Matrix4.identity(),
            curve: Curves.easeOut,
            height: 350,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jobModel.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 25)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("$companyEmoji ${jobModel.organization}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black)),
                            const SizedBox(width: 10),
                            Text(
                                "${jobModel.isRemote ? computerEmoji : locationEmoji} ${jobModel.isRemote ? "Remote available" : jobModel.organization}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
