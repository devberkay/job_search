import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotlightCard extends HookConsumerWidget {
  const SpotlightCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        useAnimationController(duration: Duration(milliseconds: 250));
    final elevationAnimation =
        Tween<double>(begin: 0, end: 5).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
    return MouseRegion(
      onEnter: (event) {
        controller.forward();
      },
      onExit: (event) {
        controller.reverse();
      },
      child: AnimatedBuilder(
          animation: controller,
          child: Container(
            width: 300,
            height: 275,
          ),
          builder: (context, child) {
            return Card(
              elevation: elevationAnimation.value,
              shadowColor: Colors.grey.shade400,
              color: Colors.white,
              child: child,
            );
          }),
    );
  }
}
