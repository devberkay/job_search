import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketingImageIndexProvider =
    StreamProvider.autoDispose<int>((ref) async* {
  yield* Stream.periodic(const Duration(milliseconds: 2400), (index) {
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

  

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        ref.watch(marketingImageIndexProvider).asData?.value ?? 0;
    final url = "marketing$currentIndex.jpg";
    debugPrint("no fucking way:$currentIndex");

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
            child: Image.asset(
              "assets/$url",
              fit: BoxFit.cover,
              width: 350,
              height: 350,
              gaplessPlayback: true,
            )),
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
