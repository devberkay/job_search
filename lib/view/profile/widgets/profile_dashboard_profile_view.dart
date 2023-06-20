import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final draftUserModelProvider = StateProvider.autoDispose<UserModel?>((ref) {
  return null;
});

class ProfileDashboardProfileView extends HookConsumerWidget {
  const ProfileDashboardProfileView({super.key, required this.usermodel});
  final UserModel usermodel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(draftUserModelProvider, (previous, next) {});
    final user = ref.watch(userProvider);
    final isSelf = usermodel.uid == user!.uid;
    if (isSelf) {
      return Column(
        children: [
          ProfileAvatar(radius: 50, userId: usermodel.uid),
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  const Text("Name",style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          usermodel.copyWith(name: value);
                    },
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: usermodel.name),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Last name",style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          usermodel.copyWith(surname: value);
                    },
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: usermodel.name),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  const Text("Phone",style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          usermodel.copyWith(phone: value);
                    },
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: usermodel.name),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Mail",style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          usermodel.copyWith(mail: value);
                    },
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: usermodel.name),
                  )
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
