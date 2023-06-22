import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/service/firestore/publish_service.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/view/profile/widgets/profile_general_use_dropdown_button.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class ProfileDashboardCreateJobPostView extends HookConsumerWidget {
  const ProfileDashboardCreateJobPostView({super.key});

  bool isValid(
      {required String title,
      required String aboutJob,
      required List<String> minimumQualifications,
      required List<String> preferredQualifications,
      required List<String> responsibilities,
      required String degree,
      required String jobType,
      required bool isRemote,
      required String organization,
      required double salaryPerHour,
      required List<String> questionnaire}) {
    if (minimumQualifications.length > 2 &&
        preferredQualifications.length > 2 &&
        responsibilities.length > 2 &&
        minimumQualifications.length < 9 &&
        preferredQualifications.length < 9 &&
        responsibilities.length < 9) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleNotifier = useValueNotifier<String?>(null);
    final aboutJobNotifier = useValueNotifier<String?>(null);
    final minimumQualificationsNotifier = useValueNotifier<List<String>>([]);
    final preferredQualificationsNotifier = useValueNotifier<List<String>>([]);
    final responsibilitiesNotifier = useValueNotifier<List<String>>([]);
    final degreeNotifier = useValueNotifier<String?>(null);
    final jobTypeNotifier = useValueNotifier<String?>(null);
    final isRemoteNotifier = useValueNotifier<String>("No");
    final organizationNotifier = useValueNotifier<String?>(null);
    final longitudeNotifier = useValueNotifier<double?>(0);
    final latitudeNotifier = useValueNotifier<double?>(0);
    final salaryPerHourNotifier = useValueNotifier<double?>(null);
    final questionnaireNotifier = useValueNotifier<List<String>>([]);

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
                  const Text("Responsibilities (At least 3)",
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
                    placeholder: "Enter the required position's daily tasks",
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
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Job type",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  ProfileGeneralUseDropdownButton(
                      valueNotifier: jobTypeNotifier,
                      items: const [
                        "White-collar roles",
                        "Blue-collar roles",
                        "IT roles",
                        "Vehicle-driving roles",
                        "Management roles",
                        "Creative roles",
                        "Sales roles"
                      ])
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Minimum degree",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  ProfileGeneralUseDropdownButton(
                    valueNotifier: degreeNotifier,
                    items: const [
                      "Associate",
                      "Bachelor’s",
                      "Master’s",
                      "Ph.D.",
                      "Pursuing Degree",
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Remote available",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  ProfileGeneralUseDropdownButton(
                      valueNotifier: isRemoteNotifier,
                      items: const [
                        "Yes",
                        "No",
                      ])
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Salary per hour (USD)",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  ProfileGeneralUseDropdownButton(
                    valueNotifier: salaryPerHourNotifier,
                    items: List.generate(300, (index) => (index + 1.0)),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Remote available",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  ProfileGeneralUseDropdownButton(
                      valueNotifier: isRemoteNotifier,
                      items: const [
                        "Yes",
                        "No",
                      ])
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Salary per hour (USD)",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  ProfileGeneralUseDropdownButton(
                    valueNotifier: salaryPerHourNotifier,
                    items: List.generate(300, (index) => (index + 1.0)),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        ValueListenableBuilder(
            valueListenable: questionnaireNotifier,
            builder: (context, _, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Questionnaires(optional)",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onSubmitted: (value) {
                      if (questionnaireNotifier.value.length < 8) {
                        if (value.isNotEmpty) {
                          questionnaireNotifier.value = [
                            ...questionnaireNotifier.value,
                            value
                          ];
                        }
                        questionnaireController.clear();
                      }
                    },
                    controller: questionnaireController,
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
                  ...questionnaireNotifier.value.mapIndexed<Widget>((index, e) {
                    if (index == questionnaireNotifier.value.length - 1) {
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
                                    questionnaireNotifier.value = [
                                      ...questionnaireNotifier.value
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
                                        questionnaireNotifier.value = [
                                          ...questionnaireNotifier.value
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
        const SizedBox(height: 90),
        AnimatedBuilder(
            animation: Listenable.merge([
              titleNotifier,
              minimumQualificationsNotifier,
              questionnaireNotifier,
              preferredQualificationsNotifier,
              aboutJobNotifier,
              jobTypeNotifier,
              degreeNotifier,
              isRemoteNotifier,
              salaryPerHourNotifier
            ]),
            builder: (context, _) {
              return Row(
                children: [
                  Spacer(),
                  FilledCupertinoButton(
                      onPressed: () async {
                        if (jobTypeNotifier.value != null &&
                            degreeNotifier.value != null &&
                            organizationNotifier.value != null &&
                            salaryPerHourNotifier.value != null &&
                            titleNotifier.value != null &&
                            minimumQualificationsNotifier.value.length > 2 &&
                            preferredQualificationsNotifier.value.length > 2 &&
                            responsibilitiesNotifier.value.length > 2 &&
                            minimumQualificationsNotifier.value.length < 9 &&
                            preferredQualificationsNotifier.value.length < 9 &&
                            responsibilitiesNotifier.value.length < 9) {
                          await ref
                              .read(publishServiceProvider.notifier)
                              .publishJob(JobModel(
                                  title: titleNotifier.value!,
                                  titleTokens: titleNotifier.value!.split(' '),
                                  degree: degreeNotifier.value!,
                                  jobType: jobTypeNotifier.value!,
                                  isRemote: isRemoteNotifier.value == "Yes",
                                  organization: organizationNotifier.value!,
                                  searchTokens: [
                                    ...(minimumQualificationsNotifier.value
                                        .expand((element) => element.split(' '))
                                       
                                        ),
                                    ...(preferredQualificationsNotifier.value
                                        .expand((element) => element.split(' '))
                                       
                                        ),
                                    ...(responsibilitiesNotifier.value
                                        .expand((element) => element.split(' '))
                                        
                                        )
                                  ]..toSet().toList(),
                                  aboutJob: aboutJobNotifier.value!,
                                  longitude: longitudeNotifier.value!,
                                  latitude: latitudeNotifier.value!,
                                  salaryPerHour: salaryPerHourNotifier.value!,
                                  applicantCounter: 0,
                                  timestampField: FieldValue.serverTimestamp(),
                                  responsibilities:
                                      responsibilitiesNotifier.value,
                                  minimumQualifications:
                                      minimumQualificationsNotifier.value,
                                  preferredQualifications:
                                      preferredQualificationsNotifier.value));
                        } else {
                          if (jobTypeNotifier.value == null) {
                            context
                                .showErrorFlushbar("Please select a job type.");
                          } else if (degreeNotifier.value == null) {
                            context
                                .showErrorFlushbar("Please select a degree.");
                          } else if (organizationNotifier.value == null) {
                            context.showErrorFlushbar(
                                "Please enter an organization.");
                          } else if (salaryPerHourNotifier.value == null) {
                            context.showErrorFlushbar(
                                "Please enter a salary per hour.");
                          } else if (titleNotifier.value == null) {
                            context
                                .showErrorFlushbar("Please enter a job title.");
                          } else if (minimumQualificationsNotifier
                                  .value.length <=
                              2) {
                            context.showErrorFlushbar(
                                "Minimum qualifications should have at least 3 characters.");
                          } else if (preferredQualificationsNotifier
                                  .value.length <=
                              2) {
                            context.showErrorFlushbar(
                                "Preferred qualifications should have at least 3 characters.");
                          } else if (responsibilitiesNotifier.value.length <=
                              2) {
                            context.showErrorFlushbar(
                                "Responsibilities should have at least 3 characters.");
                          } else if (minimumQualificationsNotifier
                                  .value.length >=
                              9) {
                            context.showErrorFlushbar(
                                "Minimum qualifications should have fewer than 9 characters.");
                          } else if (preferredQualificationsNotifier
                                  .value.length >=
                              9) {
                            context.showErrorFlushbar(
                                "Preferred qualifications should have fewer than 9 characters.");
                          } else if (responsibilitiesNotifier.value.length >=
                              9) {
                            context.showErrorFlushbar(
                                "Responsibilities should have fewer than 9 characters.");
                          }
                        }
                      },
                      height: 50,
                      width: 150,
                      fillColor: (jobTypeNotifier.value != null &&
                              degreeNotifier.value != null &&
                              organizationNotifier.value != null &&
                              salaryPerHourNotifier.value != null &&
                              titleNotifier.value != null &&
                              minimumQualificationsNotifier.value.length > 2 &&
                              preferredQualificationsNotifier.value.length >
                                  2 &&
                              responsibilitiesNotifier.value.length > 2 &&
                              minimumQualificationsNotifier.value.length < 9 &&
                              preferredQualificationsNotifier.value.length <
                                  9 &&
                              responsibilitiesNotifier.value.length < 9)
                          ? Colors.blueAccent
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                      child: HookConsumer(builder: (context, ref, child) {
                        final isUpdating = ref.watch(publishServiceProvider);
                        return isUpdating.when(data: (_) {
                          return Text("Save changes",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: (jobTypeNotifier.value != null &&
                                          degreeNotifier.value != null &&
                                          organizationNotifier.value != null &&
                                          salaryPerHourNotifier.value != null &&
                                          titleNotifier.value != null &&
                                          minimumQualificationsNotifier
                                                  .value.length >
                                              2 &&
                                          preferredQualificationsNotifier
                                                  .value.length >
                                              2 &&
                                          responsibilitiesNotifier
                                                  .value.length >
                                              2 &&
                                          minimumQualificationsNotifier
                                                  .value.length <
                                              9 &&
                                          preferredQualificationsNotifier
                                                  .value.length <
                                              9 &&
                                          responsibilitiesNotifier
                                                  .value.length <
                                              9)
                                      ? Colors.white
                                      : Colors.grey.shade400));
                        }, error: (e, st) {
                          return const Center(
                            child: SpinKitRing(
                              size: 20,
                              lineWidth: 3,
                              duration: Duration(milliseconds: 500),
                              color: Colors.white,
                            ),
                          );
                        }, loading: () {
                          return const Center(
                            child: SpinKitRing(
                              size: 20,
                              lineWidth: 3,
                              duration: Duration(milliseconds: 500),
                              color: Colors.white,
                            ),
                          );
                        });
                      })),
                  Spacer()
                ],
              );
            }),
        const SizedBox(height: 30),
      ],
    );
  }
}
