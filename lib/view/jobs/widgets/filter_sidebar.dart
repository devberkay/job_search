import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterSidebar extends HookConsumerWidget {
  const FilterSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.maxFinite,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        
      ),
    );
  }
}