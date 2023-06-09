import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef VoidFunction = void Function();

class HeadlessCupertinoButton extends HookConsumerWidget {
  const HeadlessCupertinoButton(
      {super.key, required this.child, required this.onPressed});
  final Widget child;
  final VoidFunction onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final doubleTween = Tween<double>(begin: 1, end: 0.75)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return MouseRegion(
      onEnter: (event) {
        controller.forward();
      },
      onExit: (event) {
        controller.reverse();
      },
      child: AnimatedBuilder(
          animation: doubleTween,
          builder: (context, _) {
            return CupertinoButton(
              minSize: 0,
              borderRadius: BorderRadius.zero,
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              child: Opacity(opacity: doubleTween.value, child: child),
            );
          }),
    );
  }
}
