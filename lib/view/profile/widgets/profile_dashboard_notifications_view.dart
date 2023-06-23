import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/service/firestore/offer_listener_stream_notifier.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardNotificationsView extends HookConsumerWidget {
  const ProfileDashboardNotificationsView({super.key});

  String textBuilder(bool? applicationStatus) {
    if (applicationStatus == null) {
      return "Application is pending";
    } else if (applicationStatus == true) {
      return "Application is accepted";
    } else {
      return "Application is rejected";
    }
  }

  Color colorBuilder(bool? applicationStatus) {
    if (applicationStatus == null) {
      return Colors.grey;
    } else if (applicationStatus == true) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: TabBar(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                controller: controller,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                overlayColor: MaterialStatePropertyAll(
                    Colors.grey.shade300.withOpacity(0.25)),
                dividerColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(
                      text: "Incoming",
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black,
                      )),
                  Tab(text: "Outgoing", icon: Icon(Icons.arrow_upward))
                ])),
        Expanded(
            flex: 12,
            child: Center(
              child: TabBarView(
                controller: controller,
                children: [
                  HookConsumer(builder: (context, ref, child) {
                    final offerStream = ref
                        .watch(offerListenerStreamNotifierProvider("INCOMING"));
                    return offerStream.when(data: (incomingOffersMergedModel) {
                      if (incomingOffersMergedModel.isNotEmpty) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          itemCount: incomingOffersMergedModel.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            return DecoratedBox(
                              decoration: const ShapeDecoration(
                                  shape: StadiumBorder(
                                      side: BorderSide(color: Colors.black))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ProfileBoxStatic(
                                      userModel:
                                          incomingOffersMergedModel[index]
                                              .applicantModel,
                                      height: 40,
                                      width: 120),
                                  const Text(
                                    "have sent you following job offer",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 10),
                                  HeadlessCupertinoButton(
                                    onPressed: () {},
                                    child: Chip(
                                      shape: const StadiumBorder(
                                          side:
                                              BorderSide(color: Colors.black)),
                                      backgroundColor: Colors.grey.shade200,
                                      label: Text(
                                        incomingOffersMergedModel[index]
                                            .invitedJobModel
                                            .title,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  HeadlessCupertinoButton(
                                    onPressed: () {},
                                    child: const DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.check,
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(width: 5),
                                  HeadlessCupertinoButton(
                                    onPressed: () {},
                                    child: const DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.remove,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.question_mark,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "You haven't received any job offer yet",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }
                    }, error: (e, st) {
                      debugPrint(
                          "profile_dashboard_notifications_view.dart error : $e");
                      return const Center(
                          child: Column(
                        children: [
                          Icon(Icons.error),
                          SizedBox(height: 10),
                          Text(
                              "We are facing an issue right now. Please try again later"),
                        ],
                      ));
                    }, loading: () {
                      return const Center(
                        child: SpinKitRing(
                          color: Colors.black,
                        ),
                      );
                    });
                  }),
                  HookConsumer(builder: (context, ref, child) {
                    final offerStream = ref
                        .watch(offerListenerStreamNotifierProvider("OUTGOING"));
                    return offerStream.when(data: (outgoingOffersMergedModel) {
                      if (outgoingOffersMergedModel.isNotEmpty) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          itemCount: outgoingOffersMergedModel.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            return DecoratedBox(
                              decoration: const ShapeDecoration(
                                  shape: StadiumBorder(
                                      side: BorderSide(color: Colors.black))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ProfileBoxStatic(
                                      userModel:
                                          outgoingOffersMergedModel[index]
                                              .applicantModel,
                                      height: 40,
                                      width: 120),
                                  const Text(
                                    "has received your offer for the following job",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(width: 10),
                                  Chip(
                                    shape: const StadiumBorder(
                                        side: BorderSide(color: Colors.black)),
                                    backgroundColor: Colors.grey.shade200,
                                    label: Text(
                                      outgoingOffersMergedModel[index]
                                          .invitedJobModel
                                          .title,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  const DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.check,
                                          color: Colors.white)),
                                  const SizedBox(width: 5),
                                  const DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.question_mark,
                                          color: Colors.white)),
                                  const SizedBox(width: 5),
                                  HeadlessCupertinoButton(
                                    onPressed: () {},
                                    child: const DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.remove,
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      "( ${textBuilder(outgoingOffersMergedModel[index].jobOfferModel.status)} )",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: colorBuilder(
                                              outgoingOffersMergedModel[index]
                                                  .jobOfferModel
                                                  .status)))
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.question_mark,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "You haven't sent any job offer yet",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }
                    }, error: (e, st) {
                      debugPrint(
                          "profile_dashboard_notifications_view.dart error : $e");
                      return const Center(
                          child: Column(
                        children: [
                          Icon(Icons.error),
                          SizedBox(height: 10),
                          Text(
                              "We are facing an issue right now. Please try again later"),
                        ],
                      ));
                    }, loading: () {
                      return const Center(
                        child: SpinKitRing(
                          color: Colors.black,
                        ),
                      );
                    });
                  })
                ],
              ),
            )),
      ],
    );
  }
}
