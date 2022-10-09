import 'dart:io';
import 'dart:ui';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:restr/main.dart';
import 'package:restr/src/features/restaurant/application/restaurant_mapper.dart';
import 'package:restr/src/features/restaurant/data/repositories/restaurant_repository.dart';
import 'package:restr/src/features/restaurant/domain/restaurant.dart';
import 'package:restr/src/services/network/dio_client.dart';
import 'package:restr/src/shared/extensions/extensions.dart';
import 'package:restr/src/shared/helper/helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    debugPrint('Alarm fired!');
    final notificationHelper = NotificationHelper();
    final dio = Dio();
    final httpClient = HttpClient();
    const baseUrl = 'https://restaurant-api.dicoding.dev';
    final dioClient =
        DioClient(baseUrl: baseUrl, dio: dio, httpClient: httpClient);
    final restaurantRepository = RestaurantRepository(dioClient);
    final restaurantListResponse =
        await restaurantRepository.getRestaurantList();
    final restaurantList =
        RestaurantMapper.mapToRestaurantList(restaurantListResponse);
    final restaurant = restaurantList.maybeWhen(success: (data) {
      return data.restaurants.randomize();
    }, orElse: () {
      return Restaurant();
    });
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, restaurant);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
