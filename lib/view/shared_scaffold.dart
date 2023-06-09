import 'package:JobSearch/view/home/widgets/home_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedScaffold extends StatefulHookConsumerWidget {
  const SharedScaffold(
      {super.key, required this.routerState, required this.child});
  final GoRouterState routerState;
  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends ConsumerState<SharedScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: widget.routerState.location == "/"
            ? const HomePageAppBar(
                customPreferredSize: Size(double.infinity, 60),
              )
            : null,
        drawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: false,
        body: widget.child,
      ),
    );
  }
}
