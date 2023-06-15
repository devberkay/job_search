import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

final marketingImageIndexProvider =
    StreamProvider.autoDispose<int>((ref) async* {
  yield* Stream.periodic(const Duration(milliseconds: 3150), (index) {
    debugPrint("motfucka:${(index) % 3}");
    return index % 3;
  });
});

class MarketingImageCircle extends StatefulHookConsumerWidget {
  const MarketingImageCircle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MarketingImageCircleState();
}

class _MarketingImageCircleState extends ConsumerState<MarketingImageCircle> {
  final ImageProvider imageProvider0 = const AssetImage("marketing0.jpg");
  final ImageProvider imageProvider1 = const AssetImage("marketing1.jpg");
  final ImageProvider imageProvider2 = const AssetImage("marketing2.jpg");
  @override
  void didChangeDependencies() {
    precacheImage(imageProvider0, context);
    precacheImage(imageProvider1, context);
    precacheImage(imageProvider2, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final imageProviders = [imageProvider0, imageProvider1, imageProvider2];
    final currentIndex =
        ref.watch(marketingImageIndexProvider).asData?.value ?? 0;

    debugPrint("no fucking way:$currentIndex");

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: CircleAvatar(
            radius: 175,
            foregroundImage: AssetImage("marketing$currentIndex.jpg"),
          ),
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
