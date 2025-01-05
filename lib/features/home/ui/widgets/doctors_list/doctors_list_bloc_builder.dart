import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_advanced/features/home/logic/home_cubit.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_state.dart';

class DoctorsListBlocBuilder extends StatelessWidget {
  const DoctorsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorsError: () {
            return setupError();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(List<Doctor?>? doctorsList) {
    return DoctorsListView(doctorsList: doctorsList);
  }
}
