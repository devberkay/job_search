import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotlightTimeline extends HookConsumerWidget {
  const SpotlightTimeline({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usableWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              width: double.maxFinite,
              height: 275,
              color: Colors.grey.shade400.withOpacity(0.25),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: usableWidth * .1),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                    child: Column(),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
