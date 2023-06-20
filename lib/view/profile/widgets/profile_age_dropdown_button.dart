import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileAgeDropdownButton extends HookConsumerWidget {
  const ProfileAgeDropdownButton({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortBy = ref.watch(orderByProvider);
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      onChanged: (value) {
        
      },
      value: _displayStringBuilder(selectedSortBy ?? "Relevance"),
      items: <String>['Relevance', 'Salary', 'No of applicants', 'Date']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
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
  }
}
