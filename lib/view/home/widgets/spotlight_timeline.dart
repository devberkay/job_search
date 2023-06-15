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
                SpotlightCard(assetUrl: "whiteCollar.jpg",shortDescription: "Find jobs typically performed in office environments, involving non-manual work and requiring higher levels of education and specialized skills.",title:"White-collar roles"),
                SpotlightCard(assetUrl: "blueCollar.jpg",shortDescription: "Find jobs based on manual labor, typically in industries such as manufacturing, construction, and maintenance, often requiring specialized vocational training.",title:"Blue-collar roles"),
                SpotlightCard(assetUrl: "itRoles.jpg",shortDescription: "Find jobs that can earn a living by coding",title:"IT roles"),
                SpotlightCard(assetUrl: "vehicleDriving.jpg",shortDescription: "Find jobs about operating and maneuvering various types of vehicles, such as cars, trucks, or delivery vehicles, to transport goods, people, or provide transportation services.",title:"Vehicle-driving roles"),
                SpotlightCard(assetUrl: "managementRoles.jpg",shortDescription: "Find jobs that involve overseeing and directing teams or departments, making strategic decisions, and ensuring the efficient operation of an organization.",title:"Management roles"),
                SpotlightCard(assetUrl: "creativeRoles.jpg",shortDescription: "Find jobs in fields such as design, art, writing, or marketing, where individuals use their imagination and artistic skills to develop innovative ideas and content.",title:"Creative roles"),
                SpotlightCard(assetUrl: "salesRoles.jpg",shortDescription: "Sales roles involve promoting and selling products or services, building relationships with customers, and achieving revenue targets.",title:"Sales roles"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
