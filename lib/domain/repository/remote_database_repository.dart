import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/domain/models/milk_info.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

abstract class IRemoteDatabaseRepository {
  Stream<DatabaseEvent> getSensorDataStream();

  Future<Either<AppError, void>> updateMildQuality({required MilkInfo params});
}

@LazySingleton(as: IRemoteDatabaseRepository)
class RemoteDatabaseRepository implements IRemoteDatabaseRepository {
  final FirebaseDatabaseService _fbDatabaseService;

  RemoteDatabaseRepository(this._fbDatabaseService);

  @override
  Stream<DatabaseEvent> getSensorDataStream() {
    return _fbDatabaseService.getSensorDataStream();
  }
  
  @override
  Future<Either<AppError, void>> updateMildQuality({required MilkInfo params}) async {
    return await _fbDatabaseService.updateMildQuality(params: params);
  }
}
