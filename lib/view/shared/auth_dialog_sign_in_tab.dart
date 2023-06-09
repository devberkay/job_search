import 'package:JobSearch/view/shared/auth_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInTab extends HookConsumerWidget {
  const SignInTab(
      {super.key, required this.mailNotifier, required this.passwordNotifier});
  final ValueNotifier<String?> mailNotifier;
  final ValueNotifier<String?> passwordNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email", style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        CupertinoTextField(
          onChanged: (value) {
            mailNotifier.value = value;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Password", style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        CupertinoTextField(
          obscureText: true,
          onChanged: (value) {
            passwordNotifier.value = value;
          },
        ),
      ],
    );
  }
}
