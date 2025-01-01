import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValodationRow('At least one lowercase letter', hasLowercase),
        verticalSpacing(2),
        buildValodationRow('At least one uppercase letter', hasUppercase),
        verticalSpacing(2),
        buildValodationRow('At least one special letter', hasSpecialCharacters),
        verticalSpacing(2),
        buildValodationRow('At least one number', hasNumber),
        verticalSpacing(2),
        buildValodationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValodationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.mainGray,
        ),
        // horizontalSpacing(6),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color:
                hasValidated ? ColorsManager.mainGray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
