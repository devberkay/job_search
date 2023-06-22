import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileGeneralUseDropdownButton extends HookConsumerWidget {
  const ProfileGeneralUseDropdownButton(
      {super.key, required this.valueNotifier,required this.items});
  final ValueNotifier<dynamic> valueNotifier;
  final List<dynamic> items;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, draftModel, child) {
          return DropdownButtonHideUnderline(
              child: DropdownButton2(
            menuItemStyleData: const MenuItemStyleData(height: 30),
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
              valueNotifier.value = value;
            },
            value: valueNotifier.value.age,
            items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
              return DropdownMenuItem<dynamic>(
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


