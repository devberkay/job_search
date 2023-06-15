import 'package:JobSearch/view/home/widgets/spotlight_card.dart';
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
              children:const [
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are eligible for remote work",title:"Remote roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are based on creative skills",title:"White-collar roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are based on physical skills",title:"Blue-collar roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are eligible for remote work",title:"Remote roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are eligible for remote work",title:"Remote roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are eligible for remote work",title:"Remote roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are eligible for remote work",title:"Remote roles"),
                SpotlightCard(assetUrl: "remote.jpg",shortDescription: "Find jobs that are eligible for remote work",title:"Remote roles"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
