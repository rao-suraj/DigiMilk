import 'package:auto_route/annotations.dart';
import 'package:dhood_app/data/data_source/local/hive_service.dart';
import 'package:dhood_app/data/utils/hive_initializer.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:dhood_app/presentation/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  await HiveInitializer.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_)=> getIt<AuthCubit>()..checkAuth())],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Flutter Demo',
        theme: AppThemes.lightheme(context),
        darkTheme: AppThemes.darkTheme(context),
        themeMode: ThemeMode.system,
      ),
    );
  }
}

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$data"),
            TextButton(
                onPressed: () async {
                  // final Either<AppError, void> response =
                  //     await getIt<IFarmerRepository>()
                  //         .farmerLogin(id: 'fid001', password: '12221');
                  // response.fold((left) => print(left.message),
                  //     (right) => print("success"));
                  // FirebaseDatabase.instance
                  //     .ref('farmer/' + 'fid001')
                  //     .set({'name': "Raj", 'password': '12221'});
                  // getIt<IHiveService>().loginFarmer(
                  //     farmerInfo: FarmerInfo()
                  //       ..isLogedIn = true
                  //       ..id = "fid001");
                  getIt<IHiveService>().logOutFarmer();
                  // final response = await getIt<IHiveService>().getFarmeInfo();

                  // print(response?.isLogedIn);
                  // print(response?.id);
                },
                child: const Text("Click")),
          ],
        ),
      ),
    );
  }
}
