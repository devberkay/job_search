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
                                    ref
                                        .read(skillsListProvider.notifier)
                                        .remove(e);
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

                            return CupertinoTextField(
                              controller: controller,
                              prefix: Icon(Icons.location_on,
                                  size: 5, color: Colors.grey.shade500),
                              padding: const EdgeInsets.all(15),
                              placeholder: "Programming, Finance, UX design",
                              onSubmitted: (value) {
                                ref
                                    .read(skillsListProvider.notifier)
                                    .add(value.split(" "));
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
                                final isContain = ref.watch(
                                    degreesSetProvider.select((value) =>
                                        value.contains("Associate")));

                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .add("Associate");
                                    } else {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .remove("Associate");
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
                                          if (value == true) {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .add("Associate");
                                          } else {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .remove("Associate");
                                          }
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
                                final isContain = ref.watch(
                                    degreesSetProvider.select((value) =>
                                        value.contains("Bachelor's")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .add("Bachelor's");
                                    } else {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .remove("Bachelor's");
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
                                          if (value == true) {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .add("Bachelor's");
                                          } else {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .remove("Bachelor's");
                                          }
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
                                final isContain = ref.watch(
                                    degreesSetProvider.select(
                                        (value) => value.contains("Master's")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .add("Master's");
                                    } else {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .remove("Master's");
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
                                          if (value == true) {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .add("Master's");
                                          } else {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .remove("Master's");
                                          }
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
                                final isContain = ref.watch(
                                    degreesSetProvider.select(
                                        (value) => value.contains("Ph.D.")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .add("Ph.D.");
                                    } else {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .remove("Ph.D.");
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
                                            if (value == true) {
                                              ref
                                                  .read(degreesSetProvider
                                                      .notifier)
                                                  .add("Ph.D.");
                                            } else {
                                              ref
                                                  .read(degreesSetProvider
                                                      .notifier)
                                                  .remove("Ph.D.");
                                            }
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
                                final isContain = ref.watch(
                                    degreesSetProvider.select((value) =>
                                        value.contains("Pursuing degree")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .add("Pursuing degree");
                                    } else {
                                      ref
                                          .read(degreesSetProvider.notifier)
                                          .remove("Pursuing degree");
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
                                          if (value == true) {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .add("Pursuing degree");
                                          } else {
                                            ref
                                                .read(
                                                    degreesSetProvider.notifier)
                                                .remove("Pursuing degree");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select((value) =>
                                        value.contains("White-collar roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("White-collar roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("White-collar roles");
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
                                          if (value == true) {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .add("White-collar roles");
                                          } else {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .remove("White-collar roles");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select((value) =>
                                        value.contains("Blue-collar roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("Blue-collar roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("Blue-collar roles");
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
                                          if (value == true) {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .add("Blue-collar roles");
                                          } else {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .remove("Blue-collar roles");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select(
                                        (value) => value.contains("IT roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("IT roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("IT roles");
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
                                          if (value == true) {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .add("IT roles");
                                          } else {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .remove("IT roles");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select((value) =>
                                        value.contains("Sales roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("Sales roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("Sales roles");
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
                                          if (value == true) {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .add("Sales roles");
                                          } else {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .remove("Sales roles");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select((value) =>
                                        value.contains("Management roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("Management roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("Management roles");
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
                                          if (value == true) {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .add("Management roles");
                                          } else {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .remove("Management roles");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select((value) =>
                                        value.contains("Creative roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("Creative roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("Creative roles");
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
                                          if (value == true) {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .add("Creative roles");
                                          } else {
                                            ref
                                                .read(jobTypesSetProvider
                                                    .notifier)
                                                .remove("Creative roles");
                                          }
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
                                final isContain = ref.watch(
                                    jobTypesSetProvider.select((value) => value
                                        .contains("Vehicle-driving roles")));
                                return GestureDetector(
                                  onTap: () {
                                    if (!isContain) {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("Vehicle-driving roles");
                                    } else {
                                      ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("Vehicle-driving roles");
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
                                          debugPrint("cenkhoca: $value");
                                          if (value == true) {
                                            ref
                                          .read(jobTypesSetProvider.notifier)
                                          .add("Vehicle-driving roles");
                                          } else {
                                            ref
                                          .read(jobTypesSetProvider.notifier)
                                          .remove("Vehicle-driving roles");
                                          }
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
          // const SizedBox(height: 50),
          // FilledCupertinoButton(
          //     onPressed: () {

          //     },
          //     height: 50,
          //     width: double.maxFinite,
          //     fillColor: Colors.blueAccent.shade700,
          //     borderRadius: BorderRadius.circular(5),
          //     child: const Text("Apply filters",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.w900)))
        ],
      ),
    );
  }
}
