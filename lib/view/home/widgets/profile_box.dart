import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/profile/widgets/profile_sidebar.dart';
import 'package:JobSearch/view/shared/auth_dialog.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ProfileBox extends HookConsumerWidget {
  const ProfileBox(
      {super.key,
      required this.height,
      required this.width,
      required this.userId});
  final double height;
  final double width;
  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider(userId));
    return userModel.when(data: (_userModel) {
      if (_userModel != null) {
        return HeadlessCupertinoButton(
          onPressed: () {
            ref.read(profileSidebarIndexProvider.notifier).state = 0;
            context.go("/profile/${_userModel.uid}");
          },
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.1, vertical: height * 0.025),
            child: Row(
              children: [
                Spacer(),
                ProfileAvatar(radius: height * 0.3, userId: _userModel.uid),
                Spacer(),
                Text(_userModel.name!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.3,
                        fontWeight: FontWeight.w900)),
                Spacer(),
              ],
            ),
          ),
        );
      } else {
        return FilledCupertinoButton(
            height: height,
            width: width,
            borderRadius: BorderRadius.circular(5),
            fillColor: Colors.blueAccent.shade700,
            child: const Text("Sign in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: '',
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (ctx, anim1, anim2) => const AuthDialog(),
                transitionBuilder: (context, animation1, animation2, child) {
                  return FadeTransition(
                    opacity: animation1,
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.8,
                        end: 1.0,
                      ).animate(CurvedAnimation(
                        parent: animation1,
                        curve: Curves.easeOutBack,
                      )),
                      child: child,
                    ),
                  );
                },
              );
            });
      }
    }, error: (e, st) {
      return FilledCupertinoButton(
          height: height,
          width: width,
          borderRadius: BorderRadius.circular(5),
          fillColor: Colors.blueAccent.shade700,
          child: const Text("Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: '',
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (ctx, anim1, anim2) => const AuthDialog(),
              transitionBuilder: (context, animation1, animation2, child) {
                return FadeTransition(
                  opacity: animation1,
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.8,
                      end: 1.0,
                    ).animate(CurvedAnimation(
                      parent: animation1,
                      curve: Curves.easeOutBack,
                    )),
                    child: child,
                  ),
                );
              },
            );
          });
    }, loading: () {
      return Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(height * 0.025),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.1),
            color: Colors.white,
            border: Border.all(
                color: Colors.grey.shade600.withOpacity(0.25), width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileAvatar(
              radius: height * 0.5,
              userId: null,
            ),
            const Spacer(),
            Expanded(
                flex: 3,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade400.withOpacity(0.5),
                  highlightColor: Colors.grey.shade100.withOpacity(0.5),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade600.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(
                              constraints.maxHeight * 0.1)),
                    );
                  }),
                ))
          ],
        ),
      );
    });
  }
}
