import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailSidebar extends HookConsumerWidget {
  const DetailSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      width: 400,
    );
  }
}