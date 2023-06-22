import 'package:JobSearch/model/data/job_model.dart';
import 'package:JobSearch/model/service/firestore/application_service.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailCard extends HookConsumerWidget {
  const DetailCard({super.key, required this.jobModel});
  final JobModel jobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const companyEmoji = '\u{1F3E2}'; // display if on-site
    const locationEmoji = '\u{1F4CD}';
    const computerEmoji = '\u{1F4BB}'; // display if remote
    const moneyEmoji = '\u{1F4B5}';
    const applicantsEmoji = '\u{1F464}';
    final usDollarGreen = const Color(0xFF008543);

    final isHovering = useState(false);
    return MouseRegion(
        cursor: SystemMouseCursors.basic,
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
          // transform: isHovering.value
          //     ? Matrix4.identity().scaled(1.01)
          //     : Matrix4.identity(),
          curve: Curves.easeOut,

          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(
                        isHovering.value ? -1 : 0, isHovering.value ? -1 : 0),
                    blurRadius: isHovering.value ? 1.25 : 0,
                    spreadRadius: isHovering.value ? 1.25 : 0),
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(
                        isHovering.value ? 1 : 0, isHovering.value ? 1 : 0),
                    blurRadius: isHovering.value ? 1.25 : 0,
                    spreadRadius: isHovering.value ? 1.25 : 0)
              ]),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(jobModel.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 25)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("$companyEmoji ${jobModel.organization}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black)),
                          const SizedBox(width: 10),
                          Text(
                              "${jobModel.isRemote ? computerEmoji : locationEmoji} ${jobModel.isRemote ? "Remote available" : 'In-office'}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$moneyEmoji \$${jobModel.salaryPerHour}/hr",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: usDollarGreen)),
                      const SizedBox(width: 10),
                      Text(
                          "$applicantsEmoji ${jobModel.applicantCounter} applied",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueAccent.shade700)),
                      const SizedBox(width: 10),
                      HookConsumer(builder: (context, ref, child) {
                        final applicationServiceStatus =
                            ref.watch(applicationServiceProvider);
                        return applicationServiceStatus.when(data: (_) {
                          return FilledCupertinoButton(
                              onPressed: () {
                                if (jobModel.questionnaire == null) {
                                  ref
                                      .read(applicationServiceProvider.notifier)
                                      .applyJob(
                                          jobModel: jobModel,
                                          questionnaireAnswers: null);
                                } else {
                                  // open dialog
                                }
                              },
                              height: 35,
                              width: 105,
                              fillColor: Colors.blueAccent.shade700,
                              borderRadius: BorderRadius.circular(2.5),
                              child: const Text(
                                "Apply",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ));
                        }, error: (e, st) {
                          debugPrint("detail_card_error: $e");
                          return FilledCupertinoButton(
                              onPressed: () {
                                if (jobModel.questionnaire == null) {
                                  ref
                                      .read(applicationServiceProvider.notifier)
                                      .applyJob(
                                          jobModel: jobModel,
                                          questionnaireAnswers: null);
                                } else {
                                  // open dialog
                                }
                              },
                              height: 35,
                              width: 105,
                              fillColor: Colors.blueAccent.shade700,
                              borderRadius: BorderRadius.circular(2.5),
                              child: const Text(
                                "Apply",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ));
                        }, loading: () {
                          return FilledCupertinoButton(
                              onPressed: () {
                                
                              },
                              height: 35,
                              width: 105,
                              fillColor: Colors.blueAccent.shade700,
                              borderRadius: BorderRadius.circular(2.5),
                              child: const Center(
                          child: SpinKitRing(
                            size: 20,
                            lineWidth: 3,
                            duration: Duration(milliseconds: 500),
                            color: Colors.white,
                          ),
                        ));
                        });
                      })
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              Container(
                color: Colors.grey.shade300,
                height: 1.5,
                width: double.maxFinite,
              ),
              const SizedBox(height: 25),
              const Text("Minimum Qualifications:",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16)),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    jobModel.minimumQualifications.map<Widget>((sentence) {
                  return Text("  • $sentence",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900,
                          fontSize: 14));
                }).toList(),
              ),
              const SizedBox(height: 15),
              const Text("Preferred Qualifications:",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16)),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    jobModel.preferredQualifications.map<Widget>((sentence) {
                  return Text("  • $sentence",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900,
                          fontSize: 14));
                }).toList(),
              ),
              const SizedBox(height: 15),
              const Text("Responsibilities:",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16)),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: jobModel.responsibilities.map<Widget>((sentence) {
                  return Text("  • $sentence",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900,
                          fontSize: 14));
                }).toList(),
              )
            ],
          ),
        ));
  }
}
