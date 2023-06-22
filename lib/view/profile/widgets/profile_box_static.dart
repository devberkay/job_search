import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBoxStatic extends HookConsumerWidget {
  const ProfileBoxStatic({super.key,required this.userModel,required this.height,required this.width});
  final UserModel userModel;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HeadlessCupertinoButton(
          onPressed: () {
            context.go("/profile/${userModel.uid}");
          },
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.1, vertical: height * 0.025),
            child: Row(
              children: [
                const Spacer(),
                ProfileAvatar(radius: height * 0.3, userId: userModel.uid),
                const Spacer(),
                Text(userModel.name!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.3,
                        fontWeight: FontWeight.w900)),
                const Spacer(),
              ],
            ),
          ),
        );
      } 
  }
