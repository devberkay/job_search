import 'package:JobSearch/model/service/firestore/seeker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shouldPaginateNextUserModelPageProvider = StateProvider<bool>((ref) {
  return false;
});

class JobSeekerDashboardView extends HookConsumerWidget {
  const JobSeekerDashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldPaginateNext = ref.watch(shouldPaginateNextUserModelPageProvider);
    final jobsNotifier = ref.watch(seekerNotifierProvider(shouldPaginateNext));
    return Container();
  }
}
