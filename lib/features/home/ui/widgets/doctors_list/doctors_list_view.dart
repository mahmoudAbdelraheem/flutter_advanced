import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';

import 'doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length ?? 0,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorModel: doctorsList?[index],
          );
        },
      ),
    );
  }
}
