import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SortDropdownButton extends HookConsumerWidget {
  const SortDropdownButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSortBy = useState("Relevance");
    return DropdownButton<String>(
      value: selectedSortBy.value,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      onChanged: (String? newValue) {},
      items: <String>['Relevance', 'Date', 'Salary', 'No of applicants']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text('$value'),
        );
      }).toList(),
    );
  }
}
