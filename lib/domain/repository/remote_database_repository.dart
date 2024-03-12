import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

abstract class IRemoteDatabaseRepository {
  Stream<DatabaseEvent> getSensorDataStream();
}

@LazySingleton(as: IRemoteDatabaseRepository)
class RemoteDatabaseRepository implements IRemoteDatabaseRepository {
  final FirebaseDatabaseService _fbDatabaseService;

  RemoteDatabaseRepository(this._fbDatabaseService);

  @override
  Stream<DatabaseEvent> getSensorDataStream() {
    return _fbDatabaseService.getSensorDataStream();
  }
}
