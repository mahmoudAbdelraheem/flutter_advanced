import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specializations_list/specializations_list_bloc_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/doctors_list/doctors_list_bloc_builder.dart';
import 'widgets/doctors_list/doctors_speciality_see_all.dart';
import 'widgets/doctors_list/doctors_blue_container.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpacing(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpacing(16),
              const SpecializationsListBlocBuilder(),
              verticalSpacing(8),
              const DoctorsListBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
