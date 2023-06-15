import 'package:JobSearch/model/provider/auth/auth_notifier.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/shared/auth_dialog.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DismissibleReminder extends HookConsumerWidget {
  const DismissibleReminder({super.key, required this.isDismissed});
  final ValueNotifier<bool> isDismissed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userProvider, (previous, next) {
      if(next != null) {
        isDismissed.value = true;
      }
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      color: Colors.blueAccent.shade100.withOpacity(0.5),
      height: 40,
      width: double.maxFinite,
      child: Row(
        children: [
          Icon(CupertinoIcons.info_circle, color: Colors.blueAccent.shade700),
          const SizedBox(width: 20),
          const Text(
            "Creating a Careers profile saves your info so you can apply to jobs quickly.",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(width: 10),
          HeadlessCupertinoButton(
              child: Text("Create a profile",
                  style: TextStyle(
                      color: Colors.blueAccent.shade700,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
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
                ).then((value) {});
              }),
          const Spacer(),
          HeadlessCupertinoButton(
              child: Text("Dismiss",
                  style: TextStyle(
                      color: Colors.blueAccent.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              onPressed: () {
                isDismissed.value = !isDismissed.value;
              }),
        ],
      ),
    );
  }
}
