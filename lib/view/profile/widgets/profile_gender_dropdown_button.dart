import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/profile/widgets/profile_dashboard_profile_view.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileSexDropdownButton extends HookConsumerWidget {
  const ProfileSexDropdownButton(
      {super.key, required this.draftUserModelNotifier});
  final ValueNotifier<UserModel> draftUserModelNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      onChanged: (value) {
        draftUserModelNotifier.value =
            draftUserModelNotifier.value.copyWith(sex: value);
      },
      value: draftUserModelNotifier.value.sex,
      items: <String>['Woman', 'Man']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600),
          ),
        );
      }).toList(),
    ));
  }
}
