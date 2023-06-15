import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketingIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(marketingIndexProvider);
    final prevChild = useMemoized(
      () => CircleAvatar(
        radius: 175,
        foregroundImage: AssetImage("assets/marketing$currentIndex.jpg"),
      ),
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AvatarGlow(
          child: CircleAvatar(
            radius: 175,
            child: prevChild,
            foregroundImage: AssetImage("assets/marketing$currentIndex.jpg"),
          ),
        ),
        Positioned(
          bottom: -9,
          right: -9,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.green, width: 2)),
          ),
        ),
        Positioned(
          top: -7,
          left: -7,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.blue, width: 2)),
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.red, width: 2)),
          ),
        ),
      ],
    );
  }
}
