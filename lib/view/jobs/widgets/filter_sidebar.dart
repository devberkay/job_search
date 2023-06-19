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
      height: double.infinity,
      width: 400,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(color: Colors.grey.shade400))),
      child: ListView(
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
            final expansionPanel0 = useState<bool>(false);
            final expansionPanel1 = useState<bool>(false);
            final expansionPanel2 = useState<bool>(false);
            final expansionPanel3 = useState<bool>(false);
            final expansionPanel4 = useState<bool>(false);
            return ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                debugPrint("panelIndex: $panelIndex");

                if (isExpanded) {
                  if (panelIndex == 0) {
                    expansionPanel0.value = false;
                  } else if (panelIndex == 1) {
                    expansionPanel1.value = false;
                  } else if (panelIndex == 2) {
                    expansionPanel2.value = false;
                  } else if (panelIndex == 3) {
                    expansionPanel3.value = false;
                  } else if (panelIndex == 4) {
                    expansionPanel4.value = false;
                  }
                } else {
                  if (panelIndex == 0) {
                    expansionPanel0.value = true;
                  } else if (panelIndex == 1) {
                    expansionPanel1.value = true;
                  } else if (panelIndex == 2) {
                    expansionPanel2.value = true;
                  } else if (panelIndex == 3) {
                    expansionPanel3.value = true;
                  } else if (panelIndex == 4) {
                    expansionPanel4.value = true;
                  }
                }
              },
              dividerColor: Colors.grey.shade300,
              children: [
                ExpansionPanel(
                    isExpanded: expansionPanel0.value,
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
                    isExpanded: expansionPanel1.value,
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
                    isExpanded: expansionPanel2.value,
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 10,
                                children: [
                                  HookConsumer(builder: (context, ref, child) {
                                    final isAssociate = useState(false);
                                    return GestureDetector(
                                      onTap: () {
                                        isAssociate.value = !isAssociate.value;
                                      },
                                      child: Row(
                                        children: [
                                          CupertinoCheckbox(
                                            value: isAssociate.value,
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            onChanged: (value) {
                                              isAssociate.value =
                                                  value ?? false;
                                            },
                                          ),
                                          Text("Associate",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700))
                                        ],
                                      ),
                                    );
                                  }),
                                  HookConsumer(builder: (context, ref, child) {
                                    final isBachelor = useState(false);
                                    return GestureDetector(
                                      onTap: () {
                                        isBachelor.value = !isBachelor.value;
                                      },
                                      child: Row(
                                        children: [
                                          CupertinoCheckbox(
                                            value: isBachelor.value,
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            onChanged: (value) {
                                              isBachelor.value = value ?? false;
                                            },
                                          ),
                                          Text("Bachelor's",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700))
                                        ],
                                      ),
                                    );
                                  }),
                                  HookConsumer(builder: (context, ref, child) {
                                    final isBachelor = useState(false);
                                    return GestureDetector(
                                      onTap: () {
                                        isBachelor.value = !isBachelor.value;
                                      },
                                      child: Row(
                                        children: [
                                          CupertinoCheckbox(
                                            value: isBachelor.value,
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            onChanged: (value) {
                                              isBachelor.value = value ?? false;
                                            },
                                          ),
                                          Text("Bachelor's",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700))
                                        ],
                                      ),
                                    );
                                  }),
                                  HookConsumer(builder: (context, ref, child) {
                                    final isMaster = useState(false);
                                    return GestureDetector(
                                      onTap: () {
                                        isMaster.value = !isMaster.value;
                                      },
                                      child: Row(
                                        children: [
                                          CupertinoCheckbox(
                                            value: isMaster.value,
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            onChanged: (value) {
                                              isMaster.value = value ?? false;
                                            },
                                          ),
                                          Text("Master's",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700))
                                        ],
                                      ),
                                    );
                                  }),
                                  HookConsumer(builder: (context, ref, child) {
                                    final isPhd = useState(false);
                                    return GestureDetector(
                                      onTap: () {
                                        isPhd.value = !isPhd.value;
                                      },
                                      child: Row(
                                        children: [
                                          CupertinoCheckbox(
                                            value: isPhd.value,
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            onChanged: (value) {
                                              isPhd.value = value ?? false;
                                            },
                                          ),
                                          Text("Ph.D.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700))
                                        ],
                                      ),
                                    );
                                  }),
                                  HookConsumer(builder: (context, ref, child) {
                                    final isPursuing = useState(false);
                                    return GestureDetector(
                                      onTap: () {
                                        isPursuing.value = !isPursuing.value;
                                      },
                                      child: Row(
                                        children: [
                                          CupertinoCheckbox(
                                            value: isPursuing.value,
                                            side: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 2),
                                            onChanged: (value) {
                                              isPursuing.value = value ?? false;
                                            },
                                          ),
                                          Text("Pursuing degree",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade700))
                                        ],
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
                          ],
                        ))),
              ],
            );
          })
        ],
      ),
    );
  }
}
