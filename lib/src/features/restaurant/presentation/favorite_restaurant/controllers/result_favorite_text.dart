import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultFavoriteTextController extends StateNotifier<String> {
  ResultFavoriteTextController() : super('');

  void search({required String name}) {
    state = name;
  }
}

final resultFavoriteTextControllerProvider =
    StateNotifierProvider.autoDispose<ResultFavoriteTextController, String>(
  (ref) => ResultFavoriteTextController(),
);
