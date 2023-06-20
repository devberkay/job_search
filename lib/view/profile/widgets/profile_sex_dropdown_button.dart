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
    return ValueListenableBuilder(
        valueListenable: draftUserModelNotifier,
        builder: (context, draftModel, child) {
          return DropdownButtonHideUnderline(
              child: DropdownButton2(
                menuItemStyleData: MenuItemStyleData(
              height: 30
            ),
            buttonStyleData: ButtonStyleData(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                )),
            dropdownStyleData: DropdownStyleData(
                maxHeight: 90,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                )),
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
        });
  }
}
