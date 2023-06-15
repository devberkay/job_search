import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleTimeline extends HookConsumerWidget {
  const ArticleTimeline({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          height: 100,
          color: Colors.grey.shade600.withOpacity(0.25),
        )
      ],
    );
  }
}
