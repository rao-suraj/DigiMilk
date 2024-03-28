import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/main.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/add_farmer_screen.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/dairy_dashboard_screen.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/dairy_details_screen.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/dairy_login.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/farmer_detail_screen.dart';
import 'package:dhood_app/presentation/screen/farmer/farmer_dashboard_screen.dart';
import 'package:dhood_app/presentation/screen/farmer/farmer_login_screen.dart';
import 'package:dhood_app/presentation/screen/dairy_owner/generate_bill_screen.dart';
import 'package:dhood_app/presentation/screen/farmer/milk_log_screen.dart';
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
    AutoRoute(page: MyHomeRoute.page),
    AutoRoute(page: DairyDashboardRoute.page),
    AutoRoute(page: DairyLoginRoute.page),
    AutoRoute(page: FarmerDashboardRoute.page),
    AutoRoute(page: FarmerLoginRoute.page),
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: GenereateBillRoute.page),
    AutoRoute(page: FarmerDetailsRoute.page),
    AutoRoute(page: DairyDetailsRoute.page),
    AutoRoute(page: MilkLogRoute.page),
    AutoRoute(page: AddFarmerRoute.page),
  ];
}
