import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int selectedIndex;
  const SpecialityListViewItem({
    super.key,
    this.specializationsData,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: itemIndex == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          Container(
            decoration: selectedIndex == itemIndex
                ? BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  )
                : null,
            child: CircleAvatar(
              radius: 28.r,
              backgroundColor: ColorsManager.lightBlue,
              child: SvgPicture.asset(
                'assets/svgs/general_speciality.svg',
                width: selectedIndex == itemIndex ? 42.w : 40.w,
                height: selectedIndex == itemIndex ? 42.h : 40.h,
              ),
            ),
          ),
          verticalSpacing(8),
          Text(
            specializationsData?.name ?? 'Speciality',
            style: selectedIndex == itemIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
