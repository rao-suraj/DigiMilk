// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DairyDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DairyDashboardScreen(),
      );
    },
    DairyLoginRoute.name: (routeData) {
      final args = routeData.argsAs<DairyLoginRouteArgs>(
          orElse: () => const DairyLoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: DairyLoginPage(key: args.key)),
      );
    },
    FarmerDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FarmerDashboardScreen(),
      );
    },
    FarmerDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const FarmerDetailsScreen()),
      );
    },
    FarmerLoginRoute.name: (routeData) {
      final args = routeData.argsAs<FarmerLoginRouteArgs>(
          orElse: () => const FarmerLoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: FarmerLoginScreen(key: args.key)),
      );
    },
    GenereateBillRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const GenereateBillScreen()),
      );
    },
    InitialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialScreen(),
      );
    },
    MyHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyHomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [DairyDashboardScreen]
class DairyDashboardRoute extends PageRouteInfo<void> {
  const DairyDashboardRoute({List<PageRouteInfo>? children})
      : super(
          DairyDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DairyDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DairyLoginPage]
class DairyLoginRoute extends PageRouteInfo<DairyLoginRouteArgs> {
  DairyLoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DairyLoginRoute.name,
          args: DairyLoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DairyLoginRoute';

  static const PageInfo<DairyLoginRouteArgs> page =
      PageInfo<DairyLoginRouteArgs>(name);
}

class DairyLoginRouteArgs {
  const DairyLoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DairyLoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FarmerDashboardScreen]
class FarmerDashboardRoute extends PageRouteInfo<void> {
  const FarmerDashboardRoute({List<PageRouteInfo>? children})
      : super(
          FarmerDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'FarmerDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FarmerDetailsScreen]
class FarmerDetailsRoute extends PageRouteInfo<void> {
  const FarmerDetailsRoute({List<PageRouteInfo>? children})
      : super(
          FarmerDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FarmerDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FarmerLoginScreen]
class FarmerLoginRoute extends PageRouteInfo<FarmerLoginRouteArgs> {
  FarmerLoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FarmerLoginRoute.name,
          args: FarmerLoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FarmerLoginRoute';

  static const PageInfo<FarmerLoginRouteArgs> page =
      PageInfo<FarmerLoginRouteArgs>(name);
}

class FarmerLoginRouteArgs {
  const FarmerLoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FarmerLoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [GenereateBillScreen]
class GenereateBillRoute extends PageRouteInfo<void> {
  const GenereateBillRoute({List<PageRouteInfo>? children})
      : super(
          GenereateBillRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenereateBillRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialScreen]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
