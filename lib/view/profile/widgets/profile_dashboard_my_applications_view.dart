import 'package:JobSearch/model/data/application_model.dart';
import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/service/firestore/my_applications_service.dart';
import 'package:JobSearch/view/profile/widgets/profile_box_static.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardMyApplicationsView extends HookConsumerWidget {
  const ProfileDashboardMyApplicationsView(
      {super.key, required this.applications});
  final List<ApplicationModel> applications;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myApplications = ref.watch(myApplicationsStreamProvider);
    final userModel =
        ref.watch(userModelProvider(ref.watch(userProvider)!.uid)).asData!.value!;
    return myApplications.when(
        data: (mergedModel) {
          ListView.builder(
            itemBuilder: (context, index) {
              DecoratedBox(
                decoration: const ShapeDecoration(
                    shape:
                        StadiumBorder(side: BorderSide(color: Colors.black))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileBoxStatic(
                        userModel: userModel,
                        height: 40,
                        width: 120),
                    const Text(
                      "has applied to following job published by you",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 5),
                    Chip(
                      shape: const StadiumBorder(
                          side: BorderSide(color: Colors.black)),
                      backgroundColor: Colors.grey.shade200,
                      label: Text(
                        mergedModel[index].jobModel.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 15),
                    HeadlessCupertinoButton(
                      onPressed: () {},
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: Icon(Icons.check, color: Colors.white)),
                    ),
                    const SizedBox(width: 5),
                    HeadlessCupertinoButton(
                      onPressed: () {},
                      child: const DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Icon(Icons.remove, color: Colors.white)),
                    ),
                  ],
                ),
              );
            },
          );
        },
        error: (e, st) {},
        loading: () {});
  }
}
