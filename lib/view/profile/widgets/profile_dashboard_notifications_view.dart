import 'package:JobSearch/model/data/application_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardNotificationsView extends HookConsumerWidget {
  const ProfileDashboardNotificationsView({super.key,required this.applications});
  final List<ApplicationModel> applications;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
