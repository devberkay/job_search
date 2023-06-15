import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpotlightCard extends HookConsumerWidget {
  const SpotlightCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
                  color: Colors.white,
                  child: Container(
                    width: 300,
                    height: 275,
                  ),
                );
  }
}