import 'package:JobSearch/model/service/firestore/job_notifier.dart';
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
                  onPressed: () {
                    ref.invalidate(whatDoYouWantToDoListProvider);
                    ref.invalidate(skillsListProvider);
                    ref.invalidate(degreesSetProvider);
                    ref.invalidate(jobTypesSetProvider);
                    ref.invalidate(isRemoteEligibleProvider);
                  })
            ],
          ),
          const SizedBox(height: 15),
          HookConsumer(builder: (context, ref, child) {
            final items = ref.watch(whatDoYouWantToDoListProvider);
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              children: items.map<Widget>((e) {
                return Chip(
                  label: Text(e),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey.shade400),
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  onDeleted: () {
                    var temp = items;
                    temp.remove(e);
                    ref.read(whatDoYouWantToDoListProvider.notifier).state = [
                      ...temp
                    ];
                  },
                  deleteButtonTooltipMessage: "Remove filter",
                  deleteIcon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                );
              }).toList(),
            );
          }),
          const SizedBox(height: 15),
          HookConsumer(builder: (context, ref, child) {
            final controller = useTextEditingController();
            final items = ref.watch(whatDoYouWantToDoListProvider);
            return CupertinoTextField(
              padding: const EdgeInsets.all(15),
              controller: controller,
              placeholder: "Software Engineering, Design, Sales",
              onSubmitted: (value) {
                var temp = items;
                temp.addAll(value.split(" "));
                ref.read(whatDoYouWantToDoListProvider.notifier).state = [
                  ...temp
                ];
                controller.clear();
              },
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
            );
          }),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: HookConsumer(builder: (context, ref, child) {
                          final isRemoteEligible =
                              ref.watch(isRemoteEligibleProvider);
                          return GestureDetector(
                            onTap: () {
                              ref
                                  .read(isRemoteEligibleProvider.notifier)
                                  .state = !isRemoteEligible;
                            },
                            child: Row(
                              children: [
                                CupertinoCheckbox(
                                  value: isRemoteEligible,
                                  side: BorderSide(
                                      color: Colors.grey.shade400, width: 2),
                                  onChanged: (value) {
                                    ref
                                        .read(isRemoteEligibleProvider.notifier)
                                        .state = value ?? false;
                                  },
                                ),
                                Text("Remote eligible",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700))
                              ],
                            ),
                          );
                        }))),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HookConsumer(builder: (context, ref, child) {
                            final items = ref.watch(skillsListProvider);
                            return Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: items.map<Widget>((e) {
                                return Chip(
                                  label: Text(e),
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey.shade400),
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  onDeleted: () {
                                    var temp = items;
                                    temp.remove(e);
                                    ref
                                        .read(skillsListProvider.notifier)
                                        .state = [...temp];
                                  },
                                  deleteButtonTooltipMessage: "Remove filter",
                                  deleteIcon: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                          SizedBox(height: 15),
                          HookConsumer(builder: (context, ref, child) {
                            final controller = useTextEditingController();
                            final items = ref.watch(skillsListProvider);
                            return CupertinoTextField(
                              controller: controller,
                              prefix: Icon(Icons.location_on,
                                  size: 5, color: Colors.grey.shade500),
                              padding: const EdgeInsets.all(15),
                              placeholder: "Programming, Finance, UX design",
                              onSubmitted: (value) {
                                var temp = items;
                                temp.addAll(value.split(" "));
                                ref.read(skillsListProvider.notifier).state = [...temp];
                                controller.clear();
                              },
                              placeholderStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade400
                                            .withOpacity(0.5),
                                        offset: const Offset(0, 1),
                                        blurRadius: 1)
                                  ],
                                  borderRadius: BorderRadius.circular(5)),
                            );
                          }),
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
                    body: Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 50,
                            runSpacing: 5,
                            children: [
                              HookConsumer(builder: (context, ref, child) {
                                
                                final items = ref.watch(degreesSetProvider);
                                final isContain = items.contains("Associate");
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      var temp = items;
                                      temp.add("Associate");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    } else {
                                      var temp = items;
                                      temp.remove("Associate");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    }
                                    
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isContain,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          //mayComeBack
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
                                final items = ref.watch(degreesSetProvider);
                                final isContain = items.contains("Bachelor's");
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      var temp = items;
                                      temp.add("Bachelor's");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    } else {
                                      var temp = items;
                                      temp.remove("Bachelor's");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    }
                                    
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isContain,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          //mayComeBack
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
                                final items = ref.watch(degreesSetProvider);
                                final isContain = items.contains("Master's");
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      var temp = items;
                                      temp.add("Master's");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    } else {
                                      var temp = items;
                                      temp.remove("Master's");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    }
                                    
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isContain,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          //mayComeBack
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
                                final items = ref.watch(degreesSetProvider);
                                final isContain = items.contains("Ph.D.");
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      var temp = items;
                                      temp.add("Ph.D.");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    } else {
                                      var temp = items;
                                      temp.remove("Ph.D.");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    }
                                    
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CupertinoCheckbox(
                                          value: isContain,
                                          side: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 2),
                                          onChanged: (value) {
                                            //mayComeBack
                                          },
                                        ),
                                        Text("Ph.D.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade700))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final items = ref.watch(degreesSetProvider);
                                final isContain = items.contains("Ph.D.");
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      var temp = items;
                                      temp.add("Pursuing degree");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    } else {
                                      var temp = items;
                                      temp.remove("Pursuing degree");
                                      ref.read(degreesSetProvider.notifier).state = Set.from(temp);
                                    }
                                    
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
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
                    )),
                ExpansionPanel(
                    isExpanded: expansionPanel3.value,
                    canTapOnHeader: true,
                    headerBuilder: (context, isExpanded) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Job types",
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      );
                    },
                    body: Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 50,
                            runSpacing: 5,
                            children: [
                              HookConsumer(builder: (context, ref, child) {
                                final isWhiteCollarRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isWhiteCollarRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("White-collar roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("White-collar roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    }
                                    isWhiteCollarRoles.value =
                                        !isWhiteCollarRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isWhiteCollarRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isWhiteCollarRoles.value =
                                              value ?? false;
                                        },
                                      ),
                                      Text("White-collar roles",
                                          style: TextStyle(
                                              letterSpacing: 0,
                                              fontSize: 13.75,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final isBlueCollarRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isBlueCollarRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("Blue-collar roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("Blue-collar roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    }
                                    isBlueCollarRoles.value =
                                        !isBlueCollarRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isBlueCollarRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isBlueCollarRoles.value =
                                              value ?? false;
                                        },
                                      ),
                                      Text("Blue-collar roles",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final isItRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isItRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("IT roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("IT roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    }
                                    isItRoles.value = !isItRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isItRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isItRoles.value = value ?? false;
                                        },
                                      ),
                                      Text("IT roles                  ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final isSalesRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isSalesRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("Sales roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("Sales roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    }
                                    isSalesRoles.value = !isSalesRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isSalesRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isSalesRoles.value = value ?? false;
                                        },
                                      ),
                                      Text("Sales roles",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final isManagementRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isManagementRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("Management roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("Management roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    }
                                    isManagementRoles.value =
                                        !isManagementRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isManagementRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isManagementRoles.value =
                                              value ?? false;
                                        },
                                      ),
                                      Text("Manager roles      ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final isCreativeRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isCreativeRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("Creative roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("Creative roles");
                                      jobTypesNotifier.value = Set.from(temp);
                                    }
                                    isCreativeRoles.value =
                                        !isCreativeRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isCreativeRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isCreativeRoles.value =
                                              value ?? false;
                                        },
                                      ),
                                      Text("Creative roles",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                              HookConsumer(builder: (context, ref, child) {
                                final isVehicleDrivingRoles = useState(false);
                                return GestureDetector(
                                  onTap: () {
                                    if (!isVehicleDrivingRoles.value) {
                                      var temp = jobTypesNotifier.value;
                                      temp.add("Vehicle-driving roles");
                                      jobTypesNotifier.value = temp;
                                    } else {
                                      var temp = jobTypesNotifier.value;
                                      temp.remove("Vehicle-driving roles");
                                      jobTypesNotifier.value = temp;
                                    }
                                    isVehicleDrivingRoles.value =
                                        !isVehicleDrivingRoles.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoCheckbox(
                                        value: isVehicleDrivingRoles.value,
                                        side: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 2),
                                        onChanged: (value) {
                                          isVehicleDrivingRoles.value =
                                              value ?? false;
                                        },
                                      ),
                                      Text("Vehicle-driving roles",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade700))
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            );
          }),
          const SizedBox(height: 50),
          FilledCupertinoButton(
              onPressed: () {
                ref.read(whatDoYouWantToDoListProvider.notifier).state =
                    whatDoYouWantToDoListNotifier.value;
                ref.read(skillsListProvider.notifier).state =
                    skillsNotifier.value;
                ref.read(degreesSetProvider.notifier).state =
                    degreesNotifier.value;
                ref.read(jobTypesSetProvider.notifier).state =
                    jobTypesNotifier.value;
                ref.read(isRemoteEligibleProvider.notifier).state =
                    isRemoteEligibleNotifier.value;
              },
              height: 50,
              width: double.maxFinite,
              fillColor: Colors.blueAccent.shade700,
              borderRadius: BorderRadius.circular(5),
              child: const Text("Apply filters",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900)))
        ],
      ),
    );
  }
}
