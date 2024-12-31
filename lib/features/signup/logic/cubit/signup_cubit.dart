import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/features/signup/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/signup_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (data) {
        emit(SignupState.success(data));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
