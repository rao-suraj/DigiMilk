import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class IRemoteDatabaseRepository {
  Stream<DatabaseEvent> getSensorDataStream();
}

class RemoteDatabaseRepository implements IRemoteDatabaseRepository {
  final FirebaseDatabaseService _fbDatabaseService = FirebaseDatabaseService();

  @override
  Stream<DatabaseEvent> getSensorDataStream() {
    return _fbDatabaseService.getSensorDataStream();
  }
}
