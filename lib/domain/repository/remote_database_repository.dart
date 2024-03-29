import 'package:dhood_app/data/data_source/remote/app_remote_datasource.dart';
import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:dhood_app/data/utils/api_call_with_error.dart';
import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/domain/models/get_quality_params.dart';
import 'package:dhood_app/domain/models/get_quality_response.dart';
import 'package:dhood_app/domain/models/milk_info.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

abstract class IRemoteDatabaseRepository {
  Stream<DatabaseEvent> getSensorDataStream();

  Future<Either<AppError, void>> updateMildQuality({required MilkInfo params});

  Future<Either<AppError, GetQualityResponse>> getQuality(
      {required GetQualityParams params});
}

@LazySingleton(as: IRemoteDatabaseRepository)
class RemoteDatabaseRepository implements IRemoteDatabaseRepository {
  final FirebaseDatabaseService _fbDatabaseService;
  final IRemoteDataSource _remoteRepository;

  RemoteDatabaseRepository(this._fbDatabaseService,this._remoteRepository);

  @override
  Stream<DatabaseEvent> getSensorDataStream() {
    return _fbDatabaseService.getSensorDataStream();
  }

  @override
  Future<Either<AppError, void>> updateMildQuality(
      {required MilkInfo params}) async {
    return await _fbDatabaseService.updateMildQuality(params: params);
  }

  @override
  Future<Either<AppError, GetQualityResponse>> getQuality(
      {required GetQualityParams params}) async {
        return await ApiCallWithError.call(() => _remoteRepository.getQuality(params: params.toJson()) );
      }
}
