import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/main.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/dairy_dashboard_screen.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/dairy_login.dart';
import 'package:dhood_app/presentation/screen/farmer/farmer_dashboard_screen.dart';
import 'package:dhood_app/presentation/screen/farmer/farmer_login_screen.dart';
import 'package:dhood_app/presentation/screen/generate_bill_screen.dart';
import 'package:dhood_app/presentation/screen/initial_screen.dart';
import 'package:dhood_app/presentation/screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'app_route.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: InitialRoute.page),
    AutoRoute(page: MyHomeRoute.page,initial: true),
    AutoRoute(page: DairyDashboardRoute.page),
    AutoRoute(page: DairyLoginRoute.page),
    AutoRoute(page: FarmerDashboardRoute.page),
    AutoRoute(page: FarmerLoginRoute.page),
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: GenereateBillRoute.page),
  ];
}
