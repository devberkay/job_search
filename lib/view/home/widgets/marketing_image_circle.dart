import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketingIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(marketingIndexProvider);
    return ;
  }
}