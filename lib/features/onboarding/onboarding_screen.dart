import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:flutter_advanced/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:flutter_advanced/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 30.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DocLogoAndName(),
                SizedBox(height: 20.h),
                const DoctorImageAndText(),
                Text(
                  'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                  style: TextStyles.font13GreyRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                const GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
