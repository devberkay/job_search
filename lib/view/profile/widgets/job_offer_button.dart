import 'package:JobSearch/model/service/firestore/offer_service.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobOfferButton extends HookConsumerWidget {
  const JobOfferButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HookConsumer(builder: (context, ref, child) {
      final opacityNotifier = useValueNotifier(0.0);

      return MouseRegion(
          onExit: (event) {
            opacityNotifier.value = 0.0;
          },
          onEnter: (event) {
            opacityNotifier.value = 1.0;
          },
          child: HeadlessCupertinoButton(
            onPressed: () async {
              
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: const Icon(
                      Icons.handshake,
                      size: 75,
                      color: Colors.black,
                    )),
                ValueListenableBuilder(
                    valueListenable: opacityNotifier,
                    builder: (context, opacity, child) {
                      return AnimatedOpacity(
                          opacity: opacity,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 250),
                          child: Container(
                              width: 150,
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.75),
                                  shape: BoxShape.circle),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Offer job",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Icon(
                                    Icons.insights,
                                    color: Colors.white,
                                    size: 25,
                                  )
                                ],
                              )));
                    }),
              ],
            ),
          ));
    });
  }
}
