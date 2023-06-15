import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotlightTimeline extends HookConsumerWidget {
  const SpotlightTimeline({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 100,
            color: Colors.grey.shade400.withOpacity(0.25),
          )
        ],
      ),
    );
  }
}
