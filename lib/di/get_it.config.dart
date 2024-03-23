// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_database/firebase_database.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_client.dart' as _i12;
import '../data/data_source/local/hive_service.dart' as _i9;
import '../data/data_source/remote/firebase_database.dart' as _i6;
import '../domain/repository/dairy_worker_repository.dart' as _i7;
import '../domain/repository/farmer_repository.dart' as _i8;
import '../domain/repository/local_repository.dart' as _i10;
import '../domain/repository/remote_database_repository.dart' as _i11;
import '../presentation/cubit/auth_cubit/auth_cubit.dart' as _i13;
import '../presentation/cubit/dairy_login_cubit/dairy_login_cubit.dart' as _i14;
import '../presentation/cubit/farmer_details_cubit/farmer_details_cubit.dart'
    as _i15;
import '../presentation/cubit/farmer_login_cubit/farmer_login_cubit.dart'
    as _i16;
import '../presentation/cubit/generate_bill_cubit/genearte_bill_cubit.dart'
    as _i17;
import '../presentation/routes/app_route.dart' as _i3;
import 'di_module.dart' as _i18;

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
    gh.lazySingleton<_i4.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i5.FirebaseDatabase>(() => injectableModule.database);
    gh.lazySingleton<_i6.FirebaseDatabaseService>(
        () => _i6.FirebaseDatabaseService(gh<_i5.FirebaseDatabase>()));
    gh.lazySingleton<_i7.IDairyWorkerRepository>(
        () => _i7.DairyWorkerRepository(gh<_i6.FirebaseDatabaseService>()));
    gh.lazySingleton<_i8.IFarmerRepository>(
        () => _i8.DairyWorkerRepository(gh<_i6.FirebaseDatabaseService>()));
    gh.lazySingleton<_i9.IHiveService>(() => _i9.HiveService());
    gh.lazySingleton<_i10.ILocalRepository>(
        () => _i10.LocalRepositoryImpl(gh<_i9.IHiveService>()));
    gh.lazySingleton<_i11.IRemoteDatabaseRepository>(
        () => _i11.RemoteDatabaseRepository(gh<_i6.FirebaseDatabaseService>()));
    gh.lazySingleton<_i12.ApiClient>(() => _i12.ApiClient(gh<_i4.Dio>()));
    gh.factory<_i13.AuthCubit>(
        () => _i13.AuthCubit(gh<_i10.ILocalRepository>()));
    gh.factory<_i14.DairyLoginCubit>(() => _i14.DairyLoginCubit(
          gh<_i7.IDairyWorkerRepository>(),
          gh<_i10.ILocalRepository>(),
        ));
    gh.factory<_i15.FarmerDetailsCubit>(
        () => _i15.FarmerDetailsCubit(gh<_i8.IFarmerRepository>()));
    gh.factory<_i16.FarmerLoginCubit>(() => _i16.FarmerLoginCubit(
          gh<_i8.IFarmerRepository>(),
          gh<_i10.ILocalRepository>(),
        ));
    gh.factory<_i17.GenerateBillCubit>(
        () => _i17.GenerateBillCubit(gh<_i11.IRemoteDatabaseRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i18.InjectableModule {}
