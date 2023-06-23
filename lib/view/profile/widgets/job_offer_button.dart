import 'package:JobSearch/model/service/firestore/offer_service.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobOfferButton extends HookConsumerWidget {
  const JobOfferButton({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                      // Add your custom logic here for item selection
                    );
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add your custom logic for the "Select" button
                      },
                      child: Text(
                        'Select',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
              showCustomDialog(context);
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
