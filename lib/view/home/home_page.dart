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
    return ListView(
      children: isDismissedValueNotifier.value
          ? [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 125, vertical: 50),
                child: Row(children: [
                  SizedBox(height: 275, width: 500, child: LandingTitle()),
                ]),
              ),
            ]
          : [
              DismissibleReminder(isDismissed: isDismissedValueNotifier),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 125, vertical: 50),
                child: Row(children: [
                  SizedBox(height: 300, width: 600, child: LandingTitle()),
                ]),
              ),
            ],
    );
  }
}
