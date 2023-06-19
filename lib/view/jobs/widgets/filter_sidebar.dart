import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterSidebar extends HookConsumerWidget {
  const FilterSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.maxFinite,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.grey.shade400))),
      child: Column(
        children: [
          Row(
            children: [
              const Text("What do you want to do?",
                  style: TextStyle(fontWeight: FontWeight.w800)),
              const Spacer(),
              HeadlessCupertinoButton(
                  child: Text("Clear filters",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent.shade700)),
                  onPressed: () {})
            ],
          ),
          const SizedBox(height: 15),
          CupertinoTextField(
            padding: const EdgeInsets.all(15),
            placeholder: "Software Engineering, Design, Sales",
            placeholderStyle: TextStyle(
                color: Colors.grey.shade400, fontWeight: FontWeight.w500),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400.withOpacity(0.5),
                      offset: const Offset(0, 1),
                      blurRadius: 1)
                ],
                borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(height: 50),
          HookConsumer(builder: (context, ref, child) {
            final selectedIndex = useState<int?>(null);
            return ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                debugPrint("panelIndex: $panelIndex");

                if (isExpanded) {
                  selectedIndex.value = null;
                } else {
                  selectedIndex.value = panelIndex;
                }
              },
              dividerColor: Colors.grey.shade300,
              children: [
                ExpansionPanel(
                    isExpanded: selectedIndex.value == 0,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Locations",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      );
                    },
                    body: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          CupertinoTextField(
                            prefix: Icon(Icons.location_on,
                                size: 5, color: Colors.grey.shade500),
                            padding: const EdgeInsets.all(15),
                            placeholder: "Famagusta, Amsterdam, California",
                            placeholderStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.grey.shade400.withOpacity(0.5),
                                      offset: const Offset(0, 1),
                                      blurRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          HookConsumer(builder: (context, ref, child) {
                            final isRemoteNotifier = useState(false);
                            return Row(
                              children: [
                                CupertinoCheckbox(
                                  value: isRemoteNotifier.value,
                                  side: BorderSide(
                                      color: Colors.grey.shade400, width: 2),
                                  onChanged: (value) {
                                    isRemoteNotifier.value = value ?? false;
                                  },
                                ),
                                Text("Remote eligible",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700))
                              ],
                            );
                          })
                        ],
                      ),
                    )),
                ExpansionPanel(
                    isExpanded: selectedIndex.value == 1,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Skills & qualifications",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      );
                    },
                    body: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          CupertinoTextField(
                            prefix: Icon(Icons.location_on,
                                size: 5, color: Colors.grey.shade500),
                            padding: const EdgeInsets.all(15),
                            placeholder: "Programming, Finance, UX design",
                            placeholderStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w500),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.grey.shade400.withOpacity(0.5),
                                      offset: const Offset(0, 1),
                                      blurRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      ),
                    )),
                    ExpansionPanel(
                    isExpanded: selectedIndex.value == 2,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Degree",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      );
                    },
                    body: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Wrap(
                        children: [
                          HookConsumer(
                            builder: (context,ref,child) {
                              final isAssociate = useState(false);
                              return Row(
                                  children: [
                                    CupertinoCheckbox(
                                      value: isAssociate.value,
                                      side: BorderSide(
                                          color: Colors.grey.shade400, width: 2),
                                      onChanged: (value) {
                                        isAssociate.value = value ?? false;
                                      },
                                    ),
                                    Text("Associate",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade700))
                                  ],
                                );
                            }
                          ),
                          HookConsumer(
                            builder: (context,ref,child) {
                              final isAssociate = useState(false);
                              return Row(
                                  children: [
                                    CupertinoCheckbox(
                                      value: isAssociate.value,
                                      side: BorderSide(
                                          color: Colors.grey.shade400, width: 2),
                                      onChanged: (value) {
                                        isAssociate.value = value ?? false;
                                      },
                                    ),
                                    Text("Bachelor's",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade700))
                                  ],
                                );
                            }
                          )
                        ],
                      )
                    )),
              ],
            );
          })
        ],
      ),
    );
  }
}
