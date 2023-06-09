import 'package:JobSearch/view/shared/auth_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpTab extends HookConsumerWidget {
  const SignUpTab(
      {super.key,
      required this.mailNotifier,
      required this.passwordNotifier,
      required this.nameNotifier,
      required this.surnameNotifier});
  final ValueNotifier<String?> mailNotifier;
  final ValueNotifier<String?> passwordNotifier;
  final ValueNotifier<String?> nameNotifier;
  final ValueNotifier<String?> surnameNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Name", style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        CupertinoTextField(
          onChanged: (value) {
            nameNotifier.value = value;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Surname", style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        CupertinoTextField(
          onChanged: (value) {
            surnameNotifier.value = value;
          },
        ),
        const SizedBox(
          height: 10,
        ),
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
            }),
      ],
    );
  }
}
