import 'package:hive_flutter/hive_flutter.dart';
import 'package:restr/src/constants/constants.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.openBox<String>(Keys.hiveRestaurantBox);
  }

  static Future<void> close() async {
    await Hive.close();
  }
}
