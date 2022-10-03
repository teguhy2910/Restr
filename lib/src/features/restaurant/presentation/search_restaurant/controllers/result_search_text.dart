import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultSearchTextController extends StateNotifier<String> {
  ResultSearchTextController() : super('');

  void search({required String name}) {
    state = name;
  }
}

final resultSearchTextControllerProvider =
    StateNotifierProvider.autoDispose<ResultSearchTextController, String>(
  (ref) => ResultSearchTextController(),
);
