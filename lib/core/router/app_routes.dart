import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_all_topics/core/constants/router_paths.dart';
import 'package:flutter_all_topics/core/router/routes.dart';
import 'package:flutter_all_topics/features/menu/presentation/pages/menu_page.dart';
import 'package:flutter_all_topics/features/rest_api/presentation/pages/rest_api_page.dart';

final router = GoRouter(
  initialLocation: RouterPaths.menu,
  routes: [
    //Menu
    GoRoute(
      path: RouterPaths.menu,
      builder: (BuildContext context, GoRouterState state) {
        return const MenuPage();
      },
    ),
    //Language
    GoRoute(
      path: RouterPaths.language,
      builder: (BuildContext context, GoRouterState state) {
        return const InternationalizationPage();
      },
    ),
    //Rest Api
    GoRoute(
      path: RouterPaths.rest,
      builder: (BuildContext context, GoRouterState state) {
        return const RestApiPage();
      },
    ),
  ],
);
