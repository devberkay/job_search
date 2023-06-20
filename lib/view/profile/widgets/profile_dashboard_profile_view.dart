import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          
        ],
      );
    }
  }
}
