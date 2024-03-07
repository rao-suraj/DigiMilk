import 'package:dhood_app/data/data_source/remote/firebase_database.dart';
import 'package:dhood_app/presentation/screen/dairy_dashboard/dairy_dashboard_screen.dart';
import 'package:dhood_app/presentation/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightheme(context),
      darkTheme: AppThemes.darkTheme(context),
      themeMode: ThemeMode.system,
      home: DairyDashboard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
                onPressed: () {
                  FirebaseDatabaseService().getSensorDataStream().listen((event) {
                    setState(() {
                      data = event.snapshot.value.toString();
                    });
                  });
                },
                child: const Text("Click")),
          ],
        ),
      ),
    );
  }
}

