import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketingIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});

  Widget _imageBuilder(int index) {
    if (index == 0) {
      return const CircleAvatar(
        radius: 225,
        foregroundImage: AssetImage("assets/marketing0.jpg"),
      );
    } else if (index == 1) {
      return const CircleAvatar(
        radius: 225,
        foregroundImage: AssetImage("assets/marketing1.jpg"),
      );
    } else {
      return const CircleAvatar(
        radius: 225,
        foregroundImage: AssetImage("assets/marketing2.jpg"),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(marketingIndexProvider);
    final prevChild = useMemoized(() => CircleAvatar(
          radius: 225,
          foregroundImage: AssetImage("assets/marketing$currentIndex.jpg"),
        ));
    debugPrint("ne oluyo amk : $currentIndex");
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 300));
    final opacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    return CircleAvatar(
      radius: 225,
      child: prevChild,
      foregroundImage: AssetImage("assets/marketing$currentIndex.jpg"),
    );
  }
}
