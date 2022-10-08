// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/common/home/presentation/controller/home_controller.dart';
import 'package:restr/src/features/common/settings/presentation/settings_page.dart';
import 'package:restr/src/features/restaurant/presentation/favorite_restaurant/favorites_page.dart';
import 'package:restr/src/features/restaurant/presentation/list_restaurant/restaurants_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider.notifier).getController;
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _buildItemBottomNav(),
      confineInSafeArea: true,
      backgroundColor: AppThemes.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(Sizes.p20),
        colorBehindNavBar: AppThemes.white,
        boxShadow: AppThemes.getNavBarShadow(),
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const RestaurantsPage(),
      const FavoritesPage(),
      const SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildItemBottomNav() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        title: 'Home',
        activeColorPrimary: AppThemes.green,
        inactiveColorPrimary: AppThemes.greenGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_rounded),
        title: 'Favorites',
        activeColorPrimary: AppThemes.green,
        inactiveColorPrimary: AppThemes.greenGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_rounded),
        title: 'Settings',
        activeColorPrimary: AppThemes.green,
        inactiveColorPrimary: AppThemes.greenGrey,
      ),
    ];
  }
}
