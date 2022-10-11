import 'package:equatable/equatable.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';

class RestaurantSearch extends Equatable {
  final int founded;
  final List<Restaurant> restaurants;

  RestaurantSearch({
    int? founded,
    List<Restaurant>? restaurants,
  })  : founded = founded ?? 0,
        restaurants = restaurants ?? [];

  @override
  List<Object?> get props => [
        founded,
        restaurants,
      ];
}
