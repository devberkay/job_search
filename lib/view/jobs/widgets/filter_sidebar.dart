import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
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
          CupertinoTextField(
            placeholder: "Software Engineering, Design, Sales",
            placeholderStyle: TextStyle(color: Colors.grey.shade400.withOpacity(0.25),fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.25),
                  offset: const Offset(0, 2),
                  blurRadius: 2
                )
              ],
              borderRadius: BorderRadius.circular(5)
            ),
          ),
          const SizedBox(height:15),
           ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              
            },
            dividerColor: Colors.grey.shade400,
            children: [
              ExpansionPanel(headerBuilder: (context,isExpanded) {}, body: body)
            ],
          )
        ],
      ),
    );
  }
}