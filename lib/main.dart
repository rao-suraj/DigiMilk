import 'package:auto_route/annotations.dart';
import 'package:dhood_app/data/utils/app_error.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/domain/repository/farmer_repository.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:dhood_app/presentation/theme/app_theme.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: AppThemes.lightheme(context),
      darkTheme: AppThemes.darkTheme(context),
      themeMode: ThemeMode.system,
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
                  final Either<AppError, void> response =
                      await getIt<IFarmerRepository>()
                          .farmerLogin(id: 'fid001', password: '12221');
                  response.fold((left) => print(left.message),
                      (right) => print("success"));
                  // FirebaseDatabase.instance
                  //     .ref('farmer/' + 'fid001')
                  //     .set({'name': "Raj", 'password': '12221'});
                },
                child: const Text("Click")),
          ],
        ),
      ),
    );
  }
}
