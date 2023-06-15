import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotlightCard extends HookConsumerWidget {
  const SpotlightCard(
      {super.key,
      required this.assetUrl,
      required this.shortDescription,
      required this.title});
  final String assetUrl;
  final String shortDescription;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 250));
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
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: AnimatedBuilder(
            animation: controller,
            child: SizedBox(
              width: 225,
              height: 275,
              child: Column(
                children: [
                  Expanded(
                      flex: 11,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            "assets/$assetUrl",
                            fit: BoxFit.cover,
                            width: 225,
                            height: constraints.maxHeight,
                          ),
                        );
                      })),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      flex: 4,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.075),
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            maxLines: 1,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: constraints.maxHeight * 0.5,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                        );
                      })),
                  Expanded(
                      flex: 16,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.075),
                          alignment: Alignment.topCenter,
                          child: Text(
                            shortDescription,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: constraints.maxHeight * 0.09,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600),
                          ),
                        );
                      })),
                ],
              ),
            ),
            builder: (context, child) {
              return Card(
                elevation: elevationAnimation.value,
                shadowColor: Colors.black,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: child,
              );
            }),
      ),
    );
  }
}
