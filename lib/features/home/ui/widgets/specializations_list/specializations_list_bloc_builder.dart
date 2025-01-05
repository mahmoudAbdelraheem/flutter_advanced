import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/spacing.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specializations_list/specialitay_shimmer_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationsListBlocBuilder extends StatelessWidget {
  const SpecializationsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setupLoading(),
          specializationsSuccess: (specializationsDataList) {
            var specializationsList = specializationsDataList;
            return setupSuccess(specializationsList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<SpecializationsData?>? specializationsDataList) {
    return SpecialityListView(
      specializationsDataList: specializationsDataList ?? [],
    );
  }

  SizedBox setupError() => const SizedBox.shrink();

  /// shimmer loading for specilizations and doctors list
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpacing(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
