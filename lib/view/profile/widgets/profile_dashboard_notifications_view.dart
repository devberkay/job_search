import 'package:JobSearch/model/data/application_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardNotificationsView extends HookConsumerWidget {
  const ProfileDashboardNotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);
    return Column(
      children: [
        Expanded(child:  TabBar(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        controller: controller,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        overlayColor:
            MaterialStatePropertyAll(Colors.grey.shade300.withOpacity(0.25)),
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
                  children:  [ListView.builder(itemBuilder: (context,index) {
                    return DecoratedBox(
              decoration: const ShapeDecoration(
                  shape: StadiumBorder(side: BorderSide(color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileBoxStatic(
                      userModel: userModel, height: 40, width: 120),
                  const Text(
                    "have applied the following job",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black)),
                    backgroundColor: Colors.grey.shade200,
                    label: Text(
                      mergedModel[index].jobModel.title,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Icon(Icons.check, color: Colors.white)),
                  const SizedBox(width: 5),
                  const DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: Icon(Icons.question_mark, color: Colors.white)),
                  const SizedBox(width: 5),
                  const DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Icon(Icons.remove, color: Colors.white)),
                  const SizedBox(width: 5),
                  Text(
                      "( ${textBuilder(mergedModel[index].applicationModel.status)} )",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: colorBuilder(
                              mergedModel[index].applicationModel.status)))
                ],
              ),
            );
                  }), ListView.builder(itemBuilder: (context,index) {

                  })],
                ),
              )),
      ],
    );
  }
}
