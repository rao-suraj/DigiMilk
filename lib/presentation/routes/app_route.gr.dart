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
    AddFarmerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AddFarmerScreen()),
      );
    },
    BillRoute.name: (routeData) {
      final args = routeData.argsAs<BillRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BillScreen(
          key: args.key,
          dairyId: args.dairyId,
          farmerId: args.farmerId,
          quality: args.quality,
          quantity: args.quantity,
          amount: args.amount,
        ),
      );
    },
    DairyDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DairyDashboardScreen(),
      );
    },
    DairyDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DairyDetailsScreen()),
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
    MilkLogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MilkLogScreen()),
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
/// [AddFarmerScreen]
class AddFarmerRoute extends PageRouteInfo<void> {
  const AddFarmerRoute({List<PageRouteInfo>? children})
      : super(
          AddFarmerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFarmerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BillScreen]
class BillRoute extends PageRouteInfo<BillRouteArgs> {
  BillRoute({
    Key? key,
    required String dairyId,
    required String farmerId,
    required String quality,
    required String quantity,
    required int amount,
    List<PageRouteInfo>? children,
  }) : super(
          BillRoute.name,
          args: BillRouteArgs(
            key: key,
            dairyId: dairyId,
            farmerId: farmerId,
            quality: quality,
            quantity: quantity,
            amount: amount,
          ),
          initialChildren: children,
        );

  static const String name = 'BillRoute';

  static const PageInfo<BillRouteArgs> page = PageInfo<BillRouteArgs>(name);
}

class BillRouteArgs {
  const BillRouteArgs({
    this.key,
    required this.dairyId,
    required this.farmerId,
    required this.quality,
    required this.quantity,
    required this.amount,
  });

  final Key? key;

  final String dairyId;

  final String farmerId;

  final String quality;

  final String quantity;

  final int amount;

  @override
  String toString() {
    return 'BillRouteArgs{key: $key, dairyId: $dairyId, farmerId: $farmerId, quality: $quality, quantity: $quantity, amount: $amount}';
  }
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
/// [DairyDetailsScreen]
class DairyDetailsRoute extends PageRouteInfo<void> {
  const DairyDetailsRoute({List<PageRouteInfo>? children})
      : super(
          DairyDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DairyDetailsRoute';

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
/// [MilkLogScreen]
class MilkLogRoute extends PageRouteInfo<void> {
  const MilkLogRoute({List<PageRouteInfo>? children})
      : super(
          MilkLogRoute.name,
          initialChildren: children,
        );

  static const String name = 'MilkLogRoute';

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
