// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_database/firebase_database.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_source/remote/firebase_database.dart' as _i5;
import '../domain/repository/dairy_worker_repository.dart' as _i6;
import '../domain/repository/remote_database_repository.dart' as _i7;
import '../presentation/cubit/dairy_login_cubit/dairy_login_cubit.dart' as _i8;
import '../presentation/routes/app_route.dart' as _i3;
import 'di_module.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.FirebaseDatabase>(() => injectableModule.database);
    gh.lazySingleton<_i5.FirebaseDatabaseService>(
        () => _i5.FirebaseDatabaseService(gh<_i4.FirebaseDatabase>()));
    gh.lazySingleton<_i6.IDairyWorkerRepository>(
        () => _i6.DairyWorkerRepository(gh<_i5.FirebaseDatabaseService>()));
    gh.lazySingleton<_i7.IRemoteDatabaseRepository>(
        () => _i7.RemoteDatabaseRepository(gh<_i5.FirebaseDatabaseService>()));
    gh.factory<_i8.DairyLoginCubit>(
        () => _i8.DairyLoginCubit(gh<_i6.IDairyWorkerRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i9.InjectableModule {}
