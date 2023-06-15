import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

final marketingImageIndexProvider = StreamProvider<int>((ref) async* {
  yield* Stream.periodic(const Duration(milliseconds: 3250), (index) {
    debugPrint("motfucka:${(index) % 3}");
    return index % 3;
  });
});

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex =
        ref.watch(marketingImageIndexProvider).asData?.value ?? 0;
    
    debugPrint("no fucking way:$currentIndex");

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 175,
          foregroundImage: AssetImage("marketing$currentIndex.jpg"),
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
