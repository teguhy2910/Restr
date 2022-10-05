import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/exceptions/network_exceptions.dart';
import 'package:restr/src/features/review/domain/review_post.dart';
import 'package:restr/src/services/network/api_result.dart';
import 'package:restr/src/services/network/dio_client.dart';
import 'package:restr/src/services/network/endpoints.dart';

class ReviewRepository {
  final DioClient _dioClient;

  ReviewRepository(this._dioClient);

  Future<ApiResult<void>> postReview({required ReviewPost reviewPost}) async {
    try {
      await _dioClient.post(
        Endpoints.review,
        data: reviewPost.toJson(),
      );
      return const ApiResult.success(null);
    } catch (e, stacktrace) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(e),
        stacktrace,
      );
    }
  }
}

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepository(ref.read(dioClientProvider));
});
