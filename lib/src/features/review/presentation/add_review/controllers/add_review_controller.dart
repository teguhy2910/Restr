import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/review/application/review_service.dart';
import 'package:restr/src/features/review/domain/review_post.dart';

class AddReviewController extends StateNotifier<AsyncValue<void>> {
  AddReviewController({required this.reviewService})
      : super(const AsyncData<void>(null));

  final ReviewService reviewService;

  String _name = '';
  String _review = '';

  void nameChanged(String? value) {
    _name = value ?? '';
  }

  void reviewChanged(String? value) {
    _review = value ?? '';
  }

  Future<void> postReview({required String restaurantId}) async {
    state = const AsyncValue.loading();
    final reviewPost = ReviewPost(
      id: restaurantId,
      name: _name,
      review: _review,
    );
    final result = await reviewService.postReview(reviewPost: reviewPost);
    result.when(
      success: (data) => state = AsyncValue.data(data),
      failure: (error, stacktrace) => state = AsyncError(error, stacktrace),
    );
  }
}

final addReviewControllerProvider = StateNotifierProvider
    .autoDispose<AddReviewController, AsyncValue<void>>((ref) =>
        AddReviewController(reviewService: ref.watch(reviewServiceProvider)));
