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
    final buildEmoji = '\u{1F528}';
    String birthdayCake = '\u{1F382}';

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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${userModel.name} ${userModel.surname}" ??
                              'Unknown User',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 25)),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                              "$buildEmoji ${userModel.positionTitles.join(' ')}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black)),
                          const SizedBox(width: 10),
                          Text("${birthdayCake} ${userModel.age ?? 'Age'}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: userModel.skills
                        .map((e) => Chip(
                              label: Text(e),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.grey.shade400),
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
