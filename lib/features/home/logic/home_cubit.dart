import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/specialization_response_model.dart';
import '../data/repos/home_repo_.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsDataList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();

    response.when(
      success: (specializationsResponseModel) {
        specializationsDataList =
            specializationsResponseModel.specializationsDataList ?? [];
        getDoctorsList(specializationId: specializationsDataList!.first!.id!);
        emit(HomeState.specializationsSuccess(specializationsDataList));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationsError(apiErrorModel));
      },
    );
  }

  void getDoctorsList({
    required int specializationId,
  }) {
    List<Doctor?>? doctorsList =
        _getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorsError());
    }
  }

  /// return list of doctors by specialization id
  List<Doctor?>? _getDoctorsListBySpecializationId(int specializationId) {
    return specializationsDataList!
        .firstWhere((element) => element!.id == specializationId)
        ?.doctorsList;
  }
}
