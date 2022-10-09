import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/scheduling/data/repositories/scheduling_repository.dart';
import 'package:restr/src/services/background_service.dart';
import 'package:restr/src/shared/helper/helper.dart';

class SchedulingController extends StateNotifier<bool> {
  SchedulingController(this.ref)
      : super(ref.read(schedulingRepositoryProvider).isScheduled());

  final Ref ref;

  Future<bool> scheduledRestaurants(bool value) async {
    state = value;
    ref.read(schedulingRepositoryProvider).saveSchedule(value: value);
    if (state) {
      debugPrint('Scheduling Restaurants Activated');
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      debugPrint('Scheduling Restaurants Canceled');
      return await AndroidAlarmManager.cancel(1);
    }
  }
}

final schedulingProvider =
    StateNotifierProvider.autoDispose<SchedulingController, bool>((ref) {
  return SchedulingController(ref);
});
