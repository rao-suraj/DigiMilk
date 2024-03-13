import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/presentation/cubit/generate_bill_cubit/genearte_bill_cubit.dart';
import 'package:dhood_app/presentation/cubit/generate_bill_cubit/generate_bill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GenereateBillScreen extends StatefulWidget implements AutoRouteWrapper {
  const GenereateBillScreen({super.key});

  @override
  State<GenereateBillScreen> createState() => _GenereateBillScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GenerateBillCubit>()..getDataSensorStream(),
      child: this,
    );
  }
}

class _GenereateBillScreenState extends State<GenereateBillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Generate Bill"),
      ),
      body: Center(
        child: BlocBuilder<GenerateBillCubit, GenerateBillState>(
          builder: (context, state) {
            if (state is GenerateBillLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GenerateBillLoaded) {
              return Center(
                child: Text(state.databaseEvent.snapshot.value.toString()),
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
