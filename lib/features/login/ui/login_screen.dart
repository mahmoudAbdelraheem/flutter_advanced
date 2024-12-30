import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/core/widgets/app_text_button.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/ui/widgets/already_have_account_text.dart';
import 'package:flutter_advanced/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcom Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpacing(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpacing(36),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const EmailAndPassword(),
                    verticalSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpacing(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () => validateThenDoLogin(context),
                    ),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(60),
                    const AlreadyHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().loginFormKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
