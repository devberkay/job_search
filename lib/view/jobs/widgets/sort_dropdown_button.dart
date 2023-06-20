import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SortDropdownButton extends HookConsumerWidget {
  const SortDropdownButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortBy = ref.watch(or);
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
      onChanged: (value) {
        debugPrint("sortBy : $value");
        selectedSortBy.value = value!;
        if(value == "Salary") {
          ref.read(orderByProvider.notifier).state = "salaryPerHour";
        }
        else if(value == "No of applicants") {
          ref.read(orderByProvider.notifier).state = "applicantCounter";
        }
        else if(value == "Date") {
          ref.read(orderByProvider.notifier).state = "timestampField";
        }
        else {
          ref.read(orderByProvider.notifier).state = null;
        }
      },
      value: selectedSortBy.value,
      items: <String>['Relevance', 'Salary', 'No of applicants','Date']
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
