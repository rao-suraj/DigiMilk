import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/presentation/cubit/farmer_details_cubit/farmer_details_cubit.dart';
import 'package:dhood_app/presentation/cubit/farmer_details_cubit/farmer_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FarmerDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  const FarmerDetailsScreen({super.key});

  @override
  State<FarmerDetailsScreen> createState() => _FarmerDetailsState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FarmerDetailsCubit>()..getFarmerList(),
      child: this,
    );
  }
}

class _FarmerDetailsState extends State<FarmerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Farmer List"),
      ),
      body: Center(
        child: BlocBuilder<FarmerDetailsCubit, FarmerDetailsState>(
          builder: (context, state) {
            if (state is FarmerDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FarmerDetailsSuccrss) {
              return Center(
                child: Text(state.farmerInfo.toString()),
              );
            } else {
              return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}
