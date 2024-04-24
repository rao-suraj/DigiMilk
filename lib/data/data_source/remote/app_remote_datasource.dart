import 'package:dhood_app/data/api/api_client.dart';
import 'package:dhood_app/data/utils/api_constants.dart';
import 'package:dhood_app/domain/models/get_quality_response.dart';
import 'package:injectable/injectable.dart';

abstract class IRemoteDataSource {
  Future<GetQualityResponse> getQuality({required Map<String, dynamic> params});
}

@LazySingleton(as: IRemoteDataSource)
class RemoteDataSource extends IRemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSource(this._apiClient);

  @override
  Future<GetQualityResponse> getQuality(
      {required Map<String, dynamic> params}) async {
    try {
      print(params);
      final res =
          await _apiClient.post(path: ApiConstants.getQuality, params: params);
      print(res);
      return GetQualityResponse.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
