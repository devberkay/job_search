import 'package:JobSearch/view/home/widgets/spotlight_timeline.dart';
import 'package:JobSearch/view/home/widgets/spotligt_subtitle.dart';
import 'package:JobSearch/view/home/widgets/dismissible_reminder.dart';

import 'package:JobSearch/view/home/widgets/landing_title.dart';
import 'package:JobSearch/view/home/widgets/marketing_image_circle.dart';

import 'package:JobSearch/view/home/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isDismissedValueNotifier = useState(false);
    final usableWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: isDismissedValueNotifier.value
          ? [
              const SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: usableWidth * 0.1),
                child: const Row(children: [
                  SizedBox(
                    height: 300,
                    width: 600,
                    child: LandingTitle(),
                  ),
                  Spacer(flex: 2),
                  MarketingImageCircle(),
                  Spacer(flex: 1),
                ]),
              ),
              const SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: usableWidth * 0.1),
                  child: const SearchBox()),
              const SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: usableWidth * 0.1),
                  child: const SpotlightSubtitle()),
              const SizedBox(height: 10),
              SpotlightTimeline(),
              const SizedBox(height: 30),
            ]
          : [
              DismissibleReminder(isDismissed: isDismissedValueNotifier),
              const SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: usableWidth * 0.1),
                child: const Row(children: [
                  SizedBox(
                    height: 300,
                    width: 600,
                    child: LandingTitle(),
                  ),
                  Spacer(flex: 2),
                  MarketingImageCircle(),
                  Spacer(),
                ]),
              ),
              const SizedBox(height: 50),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: usableWidth * 0.1),
                  child: const SearchBox()),
              const SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: usableWidth * 0.1),
                  child: const SpotlightSubtitle()),
              const SizedBox(height: 10),
              SpotlightTimeline(),
              const SizedBox(height: 30),
            ],
    );
  }
}
