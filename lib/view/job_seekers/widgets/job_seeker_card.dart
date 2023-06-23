import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/utils/capitalize_text_input_formatter.dart';
import 'package:JobSearch/model/utils/word_by_word_formatter.dart';
import 'package:JobSearch/view/profile/widgets/profile_age_dropdown_button.dart';
import 'package:JobSearch/view/profile/widgets/profile_sex_dropdown_button.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobSeekerCard extends HookConsumerWidget {
  const JobSeekerCard({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Text(
        userModel.positionTitles.join(),
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      title: Text("${userModel.name} ${userModel.surname}",
          style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
