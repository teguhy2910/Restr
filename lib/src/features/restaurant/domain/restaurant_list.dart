import 'package:equatable/equatable.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';

class RestaurantList extends Equatable {
  final int count;
  final List<Restaurant> restaurants;

  RestaurantList({
    int? count,
    List<Restaurant>? restaurants,
  })  : count = count ?? 0,
        restaurants = restaurants ?? [];

  @override
  List<Object?> get props => [count, restaurants];
}
