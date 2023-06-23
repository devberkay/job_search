import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/storage/raw_picture_provider.dart';
import 'package:JobSearch/model/service/firestore/seeker_notifier.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shouldPaginateNextUserModelPageProvider = StateProvider<bool>((ref) {
  return false;
});

class JobSeekerDashboardView extends HookConsumerWidget {
  const JobSeekerDashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldPaginateNext = ref.watch(shouldPaginateNextUserModelPageProvider);
    final seekerNotifier = ref.watch(seekerNotifierProvider(shouldPaginateNext));
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: seekerNotifier.when(data: (seekers) {
          if (seekers != null && seekers.isNotEmpty) {
            debugPrint("dashboard_view.dart: OK");
            
            final userProfilePicturesFutures = Future.wait(List.generate(
                seekers.map((e) => e.uid).toSet().length,
                (index) => ref
                    .watch(rawPictureProvider(seekers[index].uid).future)
                    .catchError((error) => null)));
            return FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.separated(
                        clipBehavior: Clip.none,
                        itemCount: seekers.length + 2,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 50);
                        },
                        itemBuilder: (context, index) {
                          
                        });
                  } else {
                    return const Center(
                      child: SpinKitRing(
                        color: Colors.black,
                      ),
                    );
                  }
                },
                future: Future.wait([userProfilePicturesFutures]));
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.question_mark, size: 40),
                SizedBox(height: 25),
                Text("No jobs found",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25))
              ],
            );
          }
        }, error: (e, st) {
          debugPrint("dashboard_view.dart error: $e , \n stackTrace: $st");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error),
              const SizedBox(height: 10),
              const Text(
                  "We are facing an issue right now. Please try again later"),
              const SizedBox(height: 20),
              FilledCupertinoButton(
                  onPressed: () {
                    ref.invalidate(seekerNotifierProvider(shouldPaginateNext));
                  },
                  height: 35,
                  width: 70,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(2.5),
                  child: const Text("Retry",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)))
            ],
          );
        }, loading: () {
          return const Center(
            child: SpinKitRing(
              color: Colors.black,
            ),
          );
        }));
  }
}
