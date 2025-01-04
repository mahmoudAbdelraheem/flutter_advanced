import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_constants.dart';
import 'package:flutter_advanced/features/home/data/apis/home_apis_constants.dart';
import 'package:flutter_advanced/features/home/data/models/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApisConstants.specializaionsEP)
  Future<SpecializationResponseModel> getSpecializations();
}
