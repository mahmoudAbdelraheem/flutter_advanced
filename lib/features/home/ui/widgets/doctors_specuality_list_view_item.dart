import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  const DoctorsSpecialityListViewItem({
    super.key,
    this.specializationsData,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              width: 40.w,
              height: 40.h,
            ),
          ),
          verticalSpacing(8),
          Text(
            specializationsData?.name ?? 'Speciality',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
