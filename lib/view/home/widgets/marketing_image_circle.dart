import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      foregroundImage: NetworkImage(""),
    );
  }
}