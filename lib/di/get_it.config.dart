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

import '../data/data_source/local/hive_service.dart' as _i8;
import '../data/data_source/remote/firebase_database.dart' as _i5;
import '../domain/repository/dairy_worker_repository.dart' as _i6;
import '../domain/repository/farmer_repository.dart' as _i7;
import '../domain/repository/local_repository.dart' as _i9;
import '../domain/repository/remote_database_repository.dart' as _i10;
import '../presentation/cubit/auth_cubit/auth_cubit.dart' as _i11;
import '../presentation/cubit/dairy_login_cubit/dairy_login_cubit.dart' as _i12;
import '../presentation/cubit/farmer_login_cubit/farmer_login_cubit.dart'
    as _i13;
import '../presentation/cubit/generate_bill_cubit/genearte_bill_cubit.dart'
    as _i14;
import '../presentation/routes/app_route.dart' as _i3;
import 'di_module.dart' as _i15;

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
    gh.lazySingleton<_i7.IFarmerRepository>(
        () => _i7.DairyWorkerRepository(gh<_i5.FirebaseDatabaseService>()));
    gh.lazySingleton<_i8.IHiveService>(() => _i8.HiveService());
    gh.lazySingleton<_i9.ILocalRepository>(
        () => _i9.LocalRepositoryImpl(gh<_i8.IHiveService>()));
    gh.lazySingleton<_i10.IRemoteDatabaseRepository>(
        () => _i10.RemoteDatabaseRepository(gh<_i5.FirebaseDatabaseService>()));
    gh.factory<_i11.AuthCubit>(
        () => _i11.AuthCubit(gh<_i9.ILocalRepository>()));
    gh.factory<_i12.DairyLoginCubit>(() => _i12.DairyLoginCubit(
          gh<_i6.IDairyWorkerRepository>(),
          gh<_i9.ILocalRepository>(),
        ));
    gh.factory<_i13.FarmerLoginCubit>(() => _i13.FarmerLoginCubit(
          gh<_i7.IFarmerRepository>(),
          gh<_i9.ILocalRepository>(),
        ));
    gh.factory<_i14.GenerateBillCubit>(
        () => _i14.GenerateBillCubit(gh<_i10.IRemoteDatabaseRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i15.InjectableModule {}
