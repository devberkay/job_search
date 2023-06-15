import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotlightSubtitle extends HookConsumerWidget {
  const SpotlightSubtitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      "SPOTLIGHT",
      style: TextStyle(
          letterSpacing: 2,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700),
    );
  }
}
