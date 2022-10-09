import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restr/src/constants/constants.dart';

class SchedulingRepository {
  void saveSchedule({required bool value}) async {
    final hiveSchedule = Hive.box<bool>(Keys.hiveSchedulingBox);
    await hiveSchedule.put(Keys.hiveScheduleKey, value);
  }

  bool isScheduled() {
    final hiveSchedule = Hive.box<bool>(Keys.hiveSchedulingBox);
    return hiveSchedule.get(Keys.hiveScheduleKey, defaultValue: false) ?? false;
  }

  void deleteSchedule() async {
    final hiveSchedule = Hive.box<bool>(Keys.hiveSchedulingBox);
    await hiveSchedule.delete(Keys.hiveScheduleKey);
  }
}

final schedulingRepositoryProvider = Provider<SchedulingRepository>((ref) {
  return SchedulingRepository();
});
