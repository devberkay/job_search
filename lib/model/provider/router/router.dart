import 'dart:io';


import 'package:JobSearch/view/details/details_page.dart';
import 'package:JobSearch/view/jobs/jobs_page.dart';
import 'package:JobSearch/view/profile/profile_page.dart';
import 'package:JobSearch/view/shared/custom_slide_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:JobSearch/view/home/home_page.dart';
import 'package:JobSearch/view/shared_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(initialLocation: "/", navigatorKey: _rootNavigator, routes: [
    ShellRoute(
        navigatorKey: _shellNavigator,
        pageBuilder: ((context, state, child) {
          return CustomSlideTransition(
              key: state.pageKey,
              child: SharedScaffold(
                key: state.pageKey,
                routerState: state,
                child: child,
              ));
        }),
        routes: [
          GoRoute(
              path: "/",
              pageBuilder: (context, state) => CustomSlideTransition(
                  key: state.pageKey,
                  child: HomePage(
                    key: state.pageKey,
                  )),
                  routes: [
                    GoRoute(
                      path: "jobs",
                      pageBuilder: (context, state) => CustomSlideTransition(
                          key: state.pageKey,
                          child: JobsPage(
                            key: state.pageKey,
                          )),
                      routes: [
                        GoRoute(
                      path: "details",
                      name:"details",
                      pageBuilder: (context, state) => CustomSlideTransition(
                          key: state.pageKey,
                          child: DetailsPage(
                            key: state.pageKey,
                          )),
                    ),
                      ]
                    ),
                    GoRoute(
                      path: "profile",
                      name: "profile",
                      pageBuilder: (context, state) => CustomSlideTransition(
                          key: state.pageKey,
                          child: ProfilePage(
                            userId: state.pathParameters["userId"]!,
                            key: state.pageKey,
                          )),
                    ),
                  
                  ]),
          
        ])
  ]);
});
