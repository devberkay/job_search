import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterSidebar extends HookConsumerWidget {
  const FilterSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.maxFinite,
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.grey.shade400))
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text("What do you want to do?",style:TextStyle(fontWeight: FontWeight.w900)),
              const Spacer(),
              HeadlessCupertinoButton(child:Text("Clear filters",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blueAccent.shade700)), onPressed: () {})
            ],
          ),
          const SizedBox(height:15),
           ExpansionPanelList(
            dividerColor: Colors.grey.shade400,
            
          )
        ],
      ),
    );
  }
}