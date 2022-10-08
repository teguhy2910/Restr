import 'package:restr/src/features/restaurant/domain/restaurant.dart';

extension XSearchFavorites on List<Restaurant> {
  List<Restaurant> filterByName({required String name}) {
    return where((element) {
      return element.name.toLowerCase().contains(name.toLowerCase());
    }).toList();
  }
}
