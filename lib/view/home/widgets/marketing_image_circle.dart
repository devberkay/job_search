import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

final marketingIndexProvider = StreamProvider.autoDispose<int>((ref) async* {
  yield* Stream.periodic(const Duration(milliseconds: 3000), (index) {
    return ((index+1) % 3);
  });
});

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(marketingIndexProvider).asData?.value ?? 0;
    debugPrint("no fucking way:$currentIndex");
    final prevChild =
        useMemoized(() => AssetImage("assets/marketing$currentIndex.jpg"));

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 175,
          backgroundImage: prevChild,
          foregroundImage: AssetImage("assets/marketing$currentIndex.jpg"),
        ),
        Positioned(
          bottom: -5,
          right: -5,
          child: Container(
            height: 20,
            width: 20,
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
            height: 24,
            width: 24,
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
            height: 30,
            width: 30,
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
