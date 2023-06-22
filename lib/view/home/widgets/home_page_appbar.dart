import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/home/widgets/profile_box.dart';
import 'package:JobSearch/view/shared/auth_dialog.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key, required this.customPreferredSize});
  final Size customPreferredSize;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => customPreferredSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobSeekersEmoji = String.fromCharCode(0x1F9D1) +
        String.fromCharCode(0x200D) +
        String.fromCharCode(0x1F4BC);
    final currentUser = ref.watch(userProvider);
    return Container(
      height: customPreferredSize.height,
      width: customPreferredSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(0, 1),
          blurRadius: 2,
        )
      ]),
      child: Row(
        children: [
          HeadlessCupertinoButton(
            onPressed: () {
              context.go("/");
            },
            child: const Text(
              "Careers",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 40),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: HeadlessCupertinoButton(
              child: Text(
                '${String.fromCharCode(0x1F4C2)}  Jobs',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.go("/jobs");
              },
            ),
          ),
          const SizedBox(width: 25),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: HeadlessCupertinoButton(
              child: Text(
                "$jobSeekersEmoji  Job seekers",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            ),
          ),
          const Spacer(),
          currentUser == null
              ? FilledCupertinoButton(
                  height: 40,
                  width: 80,
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
                      transitionBuilder:
                          (context, animation1, animation2, child) {
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
                  })
              : ProfileBox(height: 50, width: 150,userId: currentUser.uid,)
        ],
      ),
    );
  }
}
