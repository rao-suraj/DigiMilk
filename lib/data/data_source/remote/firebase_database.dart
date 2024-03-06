import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  static final FirebaseDatabaseService _firebaseDatabaseService =
      FirebaseDatabaseService._internal();
  static final _fbDatabase = FirebaseDatabase.instance;
  factory FirebaseDatabaseService() {
    return _firebaseDatabaseService;
  }
  FirebaseDatabaseService._internal();

  Stream<DatabaseEvent> getSensorDataStream() {
    final dbRef = _fbDatabase.ref('sensor');
    return dbRef.onValue;
  }
}
