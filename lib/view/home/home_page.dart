import 'package:JobSearch/breakpoints.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/view/home/widgets/dismissible_reminder.dart';

import 'package:JobSearch/view/home/widgets/landing_title.dart';
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
    return Container(
        padding: EdgeInsets.zero,
        child: ListView(
          children: isDismissedValueNotifier.value ||
                  MediaQuery.of(context).size.width < BreakPoints.medium ||
                  ref.watch(userProvider) != null
              ? [
                  Container(
                      margin: const EdgeInsets.only(top: 50, left: 70),
                      height: 250,
                      width: 250,
                      child: const LandingTitle()),
                  Container(
                    margin: const EdgeInsets.only(top: 60, left: 70),
                    height: 100,
                    width: 200,
                    child: const SearchBox(),
                  )
                ]
              : [
                  DismissibleReminder(isDismissed: isDismissedValueNotifier),
                  Container(
                      margin: const EdgeInsets.only(top: 50, left: 50),
                      height: 250,
                      width: 250,
                      child: const LandingTitle()),
                  Container(
                    margin: const EdgeInsets.only(top: 60, left: 50),
                    child: const SearchBox(),
                  )
                ],
        ));
  }
}
