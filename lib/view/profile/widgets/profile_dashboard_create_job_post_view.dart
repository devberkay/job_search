import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class ProfileDashboardCreateJobPostView extends HookConsumerWidget {
  const ProfileDashboardCreateJobPostView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleNotifier = useValueNotifier<String?>(null);
    final aboutJobNotifier = useValueNotifier<String?>(null);
    final minimumQualificationsNotifier = useValueNotifier<List<String>>([]);
    final preferredQualificationsNotifier = useValueNotifier<List<String>>([]);
    final responsibilitiesNotifier = useValueNotifier<List<String>>([]);
    final degreeNotifier = useValueNotifier<String?>(null);
    final jobTypeNotifier = useValueNotifier<String?>(null);
    final isRemoteNotifier = useValueNotifier<String?>(null);
    final organizationNotifier = useValueNotifier<String?>(null);
    final longitudeNotifier = useValueNotifier<double?>(null);
    final latitudeNotifier = useValueNotifier<double?>(null);
    final salaryPerHourNotifier = useValueNotifier<double?>(null);
    final questionnaireNotifier = useValueNotifier<List<String>?>(null);

    // final titleController = useTextEditingController();
    // final aboutJobController = useTextEditingController();
    final minimumQualificationsController =
        useTextEditingController(); // onSubmitted
    final preferredQualificationsController =
        useTextEditingController(); // onSubmitted
    final responsibilitiesController =
        useTextEditingController(); // onSubmitted
    // final organizationController = useTextEditingController();
    // final longitudeController = useTextEditingController();
    // final latitudeController = useTextEditingController();
    final questionnaireController = useTextEditingController(); // onSubmitted

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Job title",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 10),
            CupertinoTextField(
              onChanged: (value) {
                titleNotifier.value = value;
              },
              maxLines: 1,
              placeholder: "Enter the required position's title",
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              placeholderStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400),
              maxLength: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Organization",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 10),
            CupertinoTextField(
              onChanged: (value) {
                organizationNotifier.value = value;
              },
              maxLines: 1,
              placeholder: "Enter the company name",
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              placeholderStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400),
              maxLength: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("About job",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 10),
            CupertinoTextField(
              onChanged: (value) {
                aboutJobNotifier.value = value;
              },
              maxLines: 5,
              placeholder: "Describe the job",
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              placeholderStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400),
              maxLength: 500,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        ValueListenableBuilder(
            valueListenable: minimumQualificationsNotifier,
            builder: (context, _, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Minimum Qualifications (At least 3)",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onSubmitted: (value) {
                      if (minimumQualificationsNotifier.value.length < 8) {
                        if (value.isNotEmpty) {
                          minimumQualificationsNotifier.value = [
                            ...minimumQualificationsNotifier.value,
                            value
                          ];
                        }
                        minimumQualificationsController.clear();
                      }
                    },
                    controller: minimumQualificationsController,
                    maxLines: 1,
                    prefix: Icon(
                      Icons.add,
                      color: Colors.grey.shade500.withOpacity(0.75),
                    ),
                    placeholder: "Enter the required position's must-to-haves",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600),
                    placeholderStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400),
                    maxLength: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...minimumQualificationsNotifier.value
                      .mapIndexed<Widget>((index, e) {
                    if (index ==
                        minimumQualificationsNotifier.value.length - 1) {
                      return HookConsumer(builder: (context, ref, child) {
                        final isHovering = useState(false);
                        return MouseRegion(
                          onEnter: (event) {
                            isHovering.value = true;
                          },
                          onExit: (event) {
                            isHovering.value = false;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            transformAlignment: Alignment.center,
                            curve: Curves.easeOut,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(isHovering.value ? -1 : 0,
                                          isHovering.value ? -1 : 0),
                                      blurRadius: isHovering.value ? 1.25 : 0,
                                      spreadRadius:
                                          isHovering.value ? 1.25 : 0),
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(isHovering.value ? 1 : 0,
                                          isHovering.value ? 1 : 0),
                                      blurRadius: isHovering.value ? 1.25 : 0,
                                      spreadRadius: isHovering.value ? 1.25 : 0)
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  e,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                HeadlessCupertinoButton(
                                  onPressed: () {
                                    minimumQualificationsNotifier.value = [
                                      ...minimumQualificationsNotifier.value
                                        ..removeAt(index)
                                    ];
                                  },
                                  child: const Icon(Icons.remove,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    } else {
                      return Column(
                        children: [
                          HookConsumer(builder: (context, ref, child) {
                            final isHovering = useState(false);
                            return MouseRegion(
                              onEnter: (event) {
                                isHovering.value = true;
                              },
                              onExit: (event) {
                                isHovering.value = false;
                              },
                              child: AnimatedContainer(
                                clipBehavior: Clip.none,
                                duration: const Duration(milliseconds: 250),
                                transformAlignment: Alignment.center,
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(
                                              isHovering.value ? -1 : 0,
                                              isHovering.value ? -1 : 0),
                                          blurRadius:
                                              isHovering.value ? 1.25 : 0,
                                          spreadRadius:
                                              isHovering.value ? 1.25 : 0),
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(
                                              isHovering.value ? 1 : 0,
                                              isHovering.value ? 1 : 0),
                                          blurRadius:
                                              isHovering.value ? 1.25 : 0,
                                          spreadRadius:
                                              isHovering.value ? 1.25 : 0)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      e,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    HeadlessCupertinoButton(
                                      onPressed: () {
                                        minimumQualificationsNotifier.value = [
                                          ...minimumQualificationsNotifier.value
                                            ..removeAt(index)
                                        ];
                                      },
                                      child: const Icon(Icons.remove,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 10),
                        ],
                      );
                    }
                  })
                ],
              );
            }),
        const SizedBox(height: 30),
        ValueListenableBuilder(
            valueListenable: preferredQualificationsNotifier,
            builder: (context, _, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Preferred Qualifications (At least 3)",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onSubmitted: (value) {
                      if (preferredQualificationsNotifier.value.length < 8) {
                        if (value.isNotEmpty) {
                          preferredQualificationsNotifier.value = [
                            ...preferredQualificationsNotifier.value,
                            value
                          ];
                        }
                        preferredQualificationsController.clear();
                      }
                    },
                    controller: preferredQualificationsController,
                    maxLines: 1,
                    prefix: Icon(
                      Icons.add,
                      color: Colors.grey.shade500.withOpacity(0.75),
                    ),
                    placeholder: "Enter the required position's nice-to-haves",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600),
                    placeholderStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400),
                    maxLength: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...preferredQualificationsNotifier.value
                      .mapIndexed<Widget>((index, e) {
                    if (index ==
                        preferredQualificationsNotifier.value.length - 1) {
                      return HookConsumer(builder: (context, ref, child) {
                        final isHovering = useState(false);
                        return MouseRegion(
                          onEnter: (event) {
                            isHovering.value = true;
                          },
                          onExit: (event) {
                            isHovering.value = false;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            transformAlignment: Alignment.center,
                            curve: Curves.easeOut,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(isHovering.value ? -1 : 0,
                                          isHovering.value ? -1 : 0),
                                      blurRadius: isHovering.value ? 1.25 : 0,
                                      spreadRadius:
                                          isHovering.value ? 1.25 : 0),
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(isHovering.value ? 1 : 0,
                                          isHovering.value ? 1 : 0),
                                      blurRadius: isHovering.value ? 1.25 : 0,
                                      spreadRadius: isHovering.value ? 1.25 : 0)
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  e,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                HeadlessCupertinoButton(
                                  onPressed: () {
                                    preferredQualificationsNotifier.value = [
                                      ...preferredQualificationsNotifier.value
                                        ..removeAt(index)
                                    ];
                                  },
                                  child: const Icon(Icons.remove,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    } else {
                      return Column(
                        children: [
                          HookConsumer(builder: (context, ref, child) {
                            final isHovering = useState(false);
                            return MouseRegion(
                              onEnter: (event) {
                                isHovering.value = true;
                              },
                              onExit: (event) {
                                isHovering.value = false;
                              },
                              child: AnimatedContainer(
                                clipBehavior: Clip.none,
                                duration: const Duration(milliseconds: 250),
                                transformAlignment: Alignment.center,
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(
                                              isHovering.value ? -1 : 0,
                                              isHovering.value ? -1 : 0),
                                          blurRadius:
                                              isHovering.value ? 1.25 : 0,
                                          spreadRadius:
                                              isHovering.value ? 1.25 : 0),
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(
                                              isHovering.value ? 1 : 0,
                                              isHovering.value ? 1 : 0),
                                          blurRadius:
                                              isHovering.value ? 1.25 : 0,
                                          spreadRadius:
                                              isHovering.value ? 1.25 : 0)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      e,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    HeadlessCupertinoButton(
                                      onPressed: () {
                                        preferredQualificationsNotifier.value =
                                            [
                                          ...preferredQualificationsNotifier
                                              .value
                                            ..removeAt(index)
                                        ];
                                      },
                                      child: const Icon(Icons.remove,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 10),
                        ],
                      );
                    }
                  })
                ],
              );
            }),
        const SizedBox(height: 30),
        ValueListenableBuilder(
            valueListenable: responsibilitiesNotifier,
            builder: (context, _, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Preferred Qualifications (At least 3)",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onSubmitted: (value) {
                      if (responsibilitiesNotifier.value.length < 8) {
                        if (value.isNotEmpty) {
                          responsibilitiesNotifier.value = [
                            ...responsibilitiesNotifier.value,
                            value
                          ];
                        }
                        responsibilitiesController.clear();
                      }
                    },
                    controller: responsibilitiesController,
                    maxLines: 1,
                    prefix: Icon(
                      Icons.add,
                      color: Colors.grey.shade500.withOpacity(0.75),
                    ),
                    placeholder: "Enter the required position's nice-to-haves",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600),
                    placeholderStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400),
                    maxLength: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...responsibilitiesNotifier.value
                      .mapIndexed<Widget>((index, e) {
                    if (index == responsibilitiesNotifier.value.length - 1) {
                      return HookConsumer(builder: (context, ref, child) {
                        final isHovering = useState(false);
                        return MouseRegion(
                          onEnter: (event) {
                            isHovering.value = true;
                          },
                          onExit: (event) {
                            isHovering.value = false;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            transformAlignment: Alignment.center,
                            curve: Curves.easeOut,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(isHovering.value ? -1 : 0,
                                          isHovering.value ? -1 : 0),
                                      blurRadius: isHovering.value ? 1.25 : 0,
                                      spreadRadius:
                                          isHovering.value ? 1.25 : 0),
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(isHovering.value ? 1 : 0,
                                          isHovering.value ? 1 : 0),
                                      blurRadius: isHovering.value ? 1.25 : 0,
                                      spreadRadius: isHovering.value ? 1.25 : 0)
                                ]),
                            child: Row(
                              children: [
                                Text(
                                  e,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                HeadlessCupertinoButton(
                                  onPressed: () {
                                    responsibilitiesNotifier.value = [
                                      ...responsibilitiesNotifier.value
                                        ..removeAt(index)
                                    ];
                                  },
                                  child: const Icon(Icons.remove,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    } else {
                      return Column(
                        children: [
                          HookConsumer(builder: (context, ref, child) {
                            final isHovering = useState(false);
                            return MouseRegion(
                              onEnter: (event) {
                                isHovering.value = true;
                              },
                              onExit: (event) {
                                isHovering.value = false;
                              },
                              child: AnimatedContainer(
                                clipBehavior: Clip.none,
                                duration: const Duration(milliseconds: 250),
                                transformAlignment: Alignment.center,
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(
                                              isHovering.value ? -1 : 0,
                                              isHovering.value ? -1 : 0),
                                          blurRadius:
                                              isHovering.value ? 1.25 : 0,
                                          spreadRadius:
                                              isHovering.value ? 1.25 : 0),
                                      BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(
                                              isHovering.value ? 1 : 0,
                                              isHovering.value ? 1 : 0),
                                          blurRadius:
                                              isHovering.value ? 1.25 : 0,
                                          spreadRadius:
                                              isHovering.value ? 1.25 : 0)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      e,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    HeadlessCupertinoButton(
                                      onPressed: () {
                                        responsibilitiesNotifier.value = [
                                          ...responsibilitiesNotifier.value
                                            ..removeAt(index)
                                        ];
                                      },
                                      child: const Icon(Icons.remove,
                                          color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 10),
                        ],
                      );
                    }
                  })
                ],
              );
            }),
      ],
    );
  }
}
