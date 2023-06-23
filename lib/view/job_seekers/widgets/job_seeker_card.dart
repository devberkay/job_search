import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/utils/capitalize_text_input_formatter.dart';
import 'package:JobSearch/model/utils/word_by_word_formatter.dart';
import 'package:JobSearch/view/profile/widgets/profile_age_dropdown_button.dart';
import 'package:JobSearch/view/profile/widgets/profile_sex_dropdown_button.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobSeekerCard extends HookConsumerWidget {
  const JobSeekerCard({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          context.go('/profile/${userModel.uid}');
        },
        child: AnimatedContainer(
          clipBehavior: Clip.none,
          duration: const Duration(milliseconds: 250),
          transformAlignment: Alignment.center,
                      curve: Curves.easeOut,
            height: 250,
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
                        Text(userModel.name ?? 'Unknown User',
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
                  ],
                ),
        ),
      ),
    );
  }
}
