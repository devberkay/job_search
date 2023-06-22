import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/view/home/widgets/profile_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedJobModelProvider = StateProvider<JobModel?>((ref) {
  return null;
});

class JobCard extends HookConsumerWidget {
  const JobCard({super.key, required this.jobModel});
  final JobModel jobModel;

  String _convertToCustomFormat(DateTime dateTime) {
    DateTime now = DateTime.now();

    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return 'Today';
    } else if (dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day) {
      return 'Yesterday';
    } else {
      String day = dateTime.day.toString().padLeft(2, '0');
      String month = dateTime.month.toString().padLeft(2, '0');
      String year = dateTime.year.toString();
      return '$day/$month/$year';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(selectedJobModelProvider, (previous, next) {});
    const companyEmoji = '\u{1F3E2}'; // display if on-site
    const locationEmoji = '\u{1F4CD}';
    const computerEmoji = '\u{1F4BB}'; // display if remote
    const moneyEmoji = '\u{1F4B5}';
    const applicantsEmoji = '\u{1F464}';
    final usDollarGreen = const Color(0xFF008543);

    final isHovering = useState(false);
    
    return MouseRegion(
      onEnter: (event) {
        isHovering.value = true;
      },
      onExit: (event) {
        isHovering.value = false;
      },
      child: InkWell(
          onTap: () {
            ref.read(selectedJobModelProvider.notifier).state = jobModel;
            context.go('/jobs/details');
          },
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
                                "${jobModel.isRemote ? computerEmoji : locationEmoji} ${jobModel.isRemote ? "Remote available" : 'In-office'}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: ProfileBox(
                              height: 40, width: 100, userId: jobModel.owner),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              Icon(Icons.update, size: 15, color: Colors.black),
                              const SizedBox(width: 3),
                              Text(
                                  _convertToCustomFormat(
                                      (jobModel.timestampField as Timestamp)
                                          .toDate()),
                                  style: TextStyle(
                                      fontSize: 9 * 1.25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text("$moneyEmoji \$${jobModel.salaryPerHour}/hr",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: usDollarGreen)),
                        const SizedBox(width: 10),
                        Text(
                            "$applicantsEmoji ${jobModel.applicantCounter} applied",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.blueAccent.shade700))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  color: Colors.grey.shade300,
                  height: 1.5,
                  width: double.maxFinite,
                ),
                const SizedBox(height: 25),
                const Text("Qualifications:",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 15)),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      jobModel.minimumQualifications.map<Widget>((sentence) {
                    return Text("  • $sentence",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900,
                            fontSize: 15));
                  }).toList(),
                )
              ],
            ),
          )),
    );
  }
}
