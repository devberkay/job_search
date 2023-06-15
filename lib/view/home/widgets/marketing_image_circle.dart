import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final marketingIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class MarketingImageCircle extends HookConsumerWidget {
  const MarketingImageCircle({super.key});

  Widget _imageBuilder(int index) {
    if(index==0) {
      
    }

    else if (index==1)

      {

      }  

    else {

    }
 
 
 }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(marketingIndexProvider);
    final controller0 = useAnimationController();
    final controller1 = useAnimationController();
    final controller2 = useAnimationController();
    return AnimatedBuilder(
        child : 
        animation: Listenable.merge([controller0, controller1, controller2]),
        builder: (context, child) {});
  }
}
