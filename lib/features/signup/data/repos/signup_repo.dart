import 'package:flutter_advanced/features/signup/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
