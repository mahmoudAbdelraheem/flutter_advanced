import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/helpers/shared_pref_helper.dart';
import 'package:flutter_advanced/core/helpers/constants.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/data/models/login_response.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));
    response.when(success: (LoginResponse loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (apiErrorModel) {
      emit(
        LoginState.loginError(apiErrorModel),
      );
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setUserTokenIntoHeaderAfterLogin(token);
  }
}
