import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/profile/widgets/profile_dashboard_profile_view.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileSexDropdownButton extends HookConsumerWidget {
  const ProfileSexDropdownButton({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draftModel = ref.watch(draftUserModelProvider);
    final draftSex = draftModel?.sex;
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      onChanged: (value) {
        ref.read(draftUserModelProvider.notifier).state = draftModel.copyWith()
      },
      value: draftSex,
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
