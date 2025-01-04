import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctor? doctorModel;
  const DoctorsListViewItem({
    super.key,
    this.doctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg?t=st=1735915668~exp=1735919268~hmac=3f4e6ad60b04f30869a18b8f28b6832065ed611aa6fe5491aaf194c0171f0641&w=740',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 110.w,
              height: 110.h,
              fit: BoxFit.contain,
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel?.name ?? 'Name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpacing(5),
                Text(
                  '${doctorModel?.degree ?? 'Degree'} | ${doctorModel?.phone ?? 'Phone'}',
                  style: TextStyles.font12GreyMeduim,
                ),
                verticalSpacing(5),
                Text(
                  doctorModel?.email ?? 'Email@email.com',
                  style: TextStyles.font12GreyMeduim,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
