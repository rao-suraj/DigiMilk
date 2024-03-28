import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/gen/assets.gen.dart';
import 'package:dhood_app/presentation/cubit/add_farmer_cubit/add_farmer_cubit.dart';
import 'package:dhood_app/presentation/cubit/add_farmer_cubit/add_farmer_state.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:dhood_app/presentation/screen/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddFarmerScreen extends StatefulWidget implements AutoRouteWrapper {
  const AddFarmerScreen({super.key});

  @override
  State<AddFarmerScreen> createState() => _AddFarmerState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddFarmerCubit>(),
      child: this,
    );
  }
}

class _AddFarmerState extends State<AddFarmerScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Add Farmer"),
      ),
      backgroundColor: colorScheme.background,
      body: BlocConsumer<AddFarmerCubit, AddFarmerStates>(
        listener: (context, state) {
          if (state is AddFarmerSuccess) {
            context.router.replaceAll([const DairyDashboardRoute()]);
          }
        },
        builder: (context, state) {
          if (state is AddFarmerLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AddFarmerInitial) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 40,
                          child: Assets.images.addFarmerSvg.svg(width: 230)),
                      Expanded(
                        flex: 35,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextfield(
                                  controller: idController,
                                  hintText: "Enter the ID (fidXXX)",
                                  obscureText: false),
                              CustomTextfield(
                                  controller: nameController,
                                  hintText: "Enter the Name",
                                  obscureText: false),
                              CustomTextfield(
                                  controller: passwordController,
                                  hintText: "Enter the password",
                                  obscureText: true),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AddFarmerCubit>().addFarmer(
                                      name: nameController.text,
                                      id: idController.text,
                                      password: passwordController.text);
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Farmer",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is AddFarmerError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(child: Text("Something went wrong"),);
          }
        },
      ),
    );
  }
}
