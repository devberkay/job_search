import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final draftUserModelProvider = StateProvider<UserModel?>((ref) {
  return null;
});



class ProfileDashboardProfileView extends HookConsumerWidget {
  const ProfileDashboardProfileView({super.key, required this.usermodel});
  final UserModel usermodel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final isSelf = usermodel.uid == user!.uid;
    if(isSelf) {
      return Container();
    }
    else {
      return Column(
        children: [
          ProfileAvatar(radius: 50, userId: usermodel.uid),
          SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  Text("Name"),
                  SizedBox(height: 10),
                  CupertinoTextField(
                    onChanged: (value) {
                      ref.read(draftUserModelProvider.notifier).state = usermodel.copyWith(name: value);
                    },
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: TextEditingController(text: usermodel.name),
                  )
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text("Last name"),
                  SizedBox(height: 10),
                  CupertinoTextField(
                    readOnly: true,
                    padding: EdgeInsets.all(10),
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
          SizedBox(height: 30),

        ],
      );
    }
  }
}
