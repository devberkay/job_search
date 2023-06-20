import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileAgeDropdownButton extends HookConsumerWidget {
  const ProfileAgeDropdownButton(
      {super.key, required this.draftUserModelNotifier});
  final ValueNotifier<UserModel> draftUserModelNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ageList = List.generate(100, (index) => index + 1);
    return ValueListenableBuilder(
        valueListenable: draftUserModelNotifier,
        builder: (context, draftModel, child) {
          return DropdownButtonHideUnderline(
              child: DropdownButton2(
            menuItemStyleData: MenuItemStyleData(height: 30),
            buttonStyleData: ButtonStyleData(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                )),
            dropdownStyleData: DropdownStyleData(
                maxHeight: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5),
                )),
            onChanged: (value) {
              draftUserModelNotifier.value =
                  draftUserModelNotifier.value.copyWith(age: value);
            },
            value: draftUserModelNotifier.value.age,
            items: ageList.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  '$value',
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
