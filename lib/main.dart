import 'package:JobSearch/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:JobSearch/model/provider/router/router.dart';
import 'package:JobSearch/theming.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );

  runApp(const ProviderScope(child: JobSearchApp()));
}

class JobSearchApp extends HookConsumerWidget {
  const JobSearchApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade600.withOpacity(0.75),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 80,
            height: 80,
            child: const SpinKitRing(
              color: Colors.white,
            )),
      ),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.8,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            )),
            child: child,
          ),
        );
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        backButtonDispatcher: router.backButtonDispatcher,
        theme: Theming.config,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
