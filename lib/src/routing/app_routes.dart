import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/restaurant/presentation/detail_restaurant/detail_restaurant_page.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/home_page.dart';
import 'package:restr/src/features/restaurant/presentation/search_restaurant/search_restaurant_page.dart';
import 'package:restr/src/features/common/splash/splash_page.dart';
import 'package:restr/src/routing/error_page.dart';
import 'package:restr/src/routing/extras.dart';

enum Routes {
  splash,
  home,
  detailRestaurant,
  searchRestaurant,
}

final goRouter = GoRouter(
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: '/',
  errorPageBuilder: (context, state) => _navigate(
    context,
    state,
    ErrorPage(
      error: state.error,
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splash.name,
      pageBuilder: (context, state) =>
          _navigate(context, state, const SplashPage()),
    ),
    GoRoute(
      path: '/home',
      name: Routes.home.name,
      pageBuilder: (context, state) =>
          _navigate(context, state, const HomePage()),
      routes: [
        GoRoute(
          path: 'detail-restaurant',
          name: Routes.detailRestaurant.name,
          pageBuilder: (context, state) {
            final extras = (state.extra as Extras).extras;
            final restaurantId = extras[Keys.restaurantId] as String;

            return _navigate(
              context,
              state,
              DetailRestaurantPage(
                restaurantId: restaurantId,
              ),
            );
          },
        ),
        GoRoute(
          path: 'search-restaurant',
          name: Routes.searchRestaurant.name,
          pageBuilder: (context, state) =>
              _navigate(context, state, const SearchRestaurantPage()),
        ),
      ],
    ),
  ],
);

Page<void> _navigate(BuildContext context, GoRouterState state, Widget screen) {
  return MaterialPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: screen,
  );
}
