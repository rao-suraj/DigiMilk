import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {

  @lazySingleton
  FirebaseDatabase get database => FirebaseDatabase.instance;
}
