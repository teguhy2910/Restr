import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends StateNotifier<void> {
  HomeController() : super(null);

  final PersistentTabController _controller = PersistentTabController();

  PersistentTabController get getController => _controller;

  int get getIndex => _controller.index;

  void setIndex(int index) => _controller.index = index;
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, void>((ref) {
  return HomeController();
});
