import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(
            'assets/images/onboarding_doctor.png',
            height: 400,
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Text(
            "Best Doctor Appointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.2,
            ),
          ),
        )
      ],
    );
  }
}
