import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final draftUserModelProvider = StateProvider.autoDispose.family<UserModel?,String>((ref,arg) {
  return ref.watch(userModelProvider(arg)).asData?.value;
});

class ProfileDashboardProfileView extends HookConsumerWidget {
  const ProfileDashboardProfileView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(draftUserModelProvider(userModel.uid), (previous, next) {});
    final user = ref.watch(userProvider);
    final isSelf = userModel.uid == user!.uid;
    if (isSelf) {
      return ListView(
        children: [
          ProfileAvatar(radius: 50, userId: userModel.uid),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Bio",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(name: value);
                    },
                    maxLines: 5,
                    placeholder: "Write something about yourself",
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
                    controller: TextEditingController(text: userModel.name),
                  )
                ],
              ),
          const SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  const Text("Name",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(name: value);
                    },
                    maxLines: 1,
                    maxLength: 20,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: userModel.name),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Last name",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(surname: value);
                    },
                    maxLines: 1,
                    maxLength: 20,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: userModel.name),
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
                  const Text("Phone",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(phone: value);
                    },
                    maxLines: 1,
                    maxLength: 15,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: userModel.name),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Mail",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(mail: value);
                    },
                    maxLines: 1,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: userModel.name),
                  )
                ],
              ),
              Row(
            children: [
              Column(
                children: [
                  const Text("Age",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(name: value);
                    },
                    maxLines: 1,
                    maxLength: 20,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: userModel.name),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Sex",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16)),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state =
                          userModel.copyWith(surname: value);
                    },
                    maxLines: 1,
                    maxLength: 20,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: userModel.name),
                  )
                ],
              ),
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
