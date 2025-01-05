import 'package:flutter_advanced/core/networking/api_error_model.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess(SignupResponse signupResponse) =
      SignupSuccess<T>;
  const factory SignupState.signupError(ApiErrorModel apiErrorModel) =
      SignupError;
}
