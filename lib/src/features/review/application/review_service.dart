import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/features/review/data/repositories/review_repository.dart';
import 'package:restr/src/features/review/domain/review_post.dart';
import 'package:restr/src/services/network/api_result.dart';

class ReviewService {
  final Ref ref;

  ReviewService({
    required this.ref,
  });

  Future<ApiResult<void>> postReview({required ReviewPost reviewPost}) async {
    return ref
        .read(reviewRepositoryProvider)
        .postReview(reviewPost: reviewPost);
  }
}

final reviewServiceProvider = Provider<ReviewService>((ref) {
  return ReviewService(
    ref: ref,
  );
});
