import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemoteCheckbox extends HookConsumerWidget {
  const RemoteCheckbox({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkBoxState = useState(false);
    return Row(
      children: [
        CupertinoCheckbox(
          value: checkBoxState.value,
          side: BorderSide(color: Colors.grey.shade400, width: 2),
          onChanged: (value) {
            checkBoxState.value = value!;
          },
        ),
        Text(
          "Remote eligible",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.grey.shade700),
        )
      ],
    );
  }
}
