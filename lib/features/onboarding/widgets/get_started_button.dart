import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll<Color>(
          ColorsManager.mainBlue,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const WidgetStatePropertyAll<Size>(
          Size(double.infinity, 52),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
