import 'package:JobSearch/view/home/widgets/marketing_image_circle.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingTitle extends HookConsumerWidget {
  const LandingTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.4,
            child: DefaultTextStyle(
              style: TextStyle(
                  fontSize: constraints.maxHeight * 0.3,
                  fontWeight: FontWeight.w900),
              child: AnimatedTextKit(
                repeatForever: true,
                onNext: (p0, p1) {
                  debugPrint("index: $p0, hasEnded: $p1");
                  ref.read(marketingIndexProvider.notifier).state = p0;
                },
                pause: const Duration(milliseconds: 100),
                animatedTexts: [
                  RotateAnimatedText('Dream',
                      duration: Duration(milliseconds: 5500),
                      alignment: Alignment.bottomLeft,
                      textStyle: const TextStyle(color: Colors.red)),
                  RotateAnimatedText('Publish',
                      duration: Duration(milliseconds: 5500),
                      alignment: Alignment.bottomLeft,
                      textStyle: const TextStyle(color: Colors.blue)),
                  RotateAnimatedText('Find',
                      duration: Duration(milliseconds: 5500),
                      alignment: Alignment.bottomLeft,
                      textStyle: const TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ),
          Text("your next job",
              style: TextStyle(
                  fontSize: constraints.maxHeight * 0.3,
                  fontWeight: FontWeight.w900,
                  color: Colors.black)),
          SizedBox(
            height: constraints.maxHeight * 0.075,
          ),
          Text(
            "Discover your next step at Careers.",
            style: TextStyle(
                fontSize: constraints.maxHeight * 0.1,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          )
        ],
      );
    });
  }
}
