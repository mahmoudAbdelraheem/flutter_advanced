import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'doctors_specuality_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorsSpecialityListView(
      {super.key, required this.specializationsDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            specializationsData: specializationsDataList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
