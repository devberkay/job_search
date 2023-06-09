import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef VoidFunction = void Function();

class FilledCupertinoButton extends HookConsumerWidget {
  const FilledCupertinoButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.fillColor,
    required this.borderRadius,
    this.boxShadow
  });
  final Widget child;
  final VoidFunction onPressed;
  final double height;
  final double width;
  final Color fillColor;
  final BorderRadius borderRadius;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = useState(false);
    final color = fillColor.withOpacity(isHovering.value ? 0.8 : 1);
    return CupertinoButton(
      minSize: 0,
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: MouseRegion(
          onEnter: (event) {
            isHovering.value = true;
          },
          onExit: (event) {
            isHovering.value = false;
          },
          child: AnimatedContainer(
              alignment: Alignment.center,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius,
                boxShadow: boxShadow
              ),
              duration: const Duration(milliseconds: 200),
              height: height,
              width: width,
              child: child)),
    );
  }
}
