import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/gen/assets.gen.dart';
import 'package:dhood_app/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:dhood_app/presentation/cubit/generate_bill_cubit/genearte_bill_cubit.dart';
import 'package:dhood_app/presentation/cubit/generate_bill_cubit/generate_bill_state.dart';
import 'package:dhood_app/presentation/screen/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final idController = TextEditingController();
  final quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Generate Bill"),
      ),
      backgroundColor: colorScheme.background,
      body: BlocBuilder<GenerateBillCubit, GenerateBillState>(
        builder: (context, state) {
          if (state is GenerateBillLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GenerateBillLoaded) {
            final data =
                state.databaseEvent.snapshot.value as Map<dynamic, dynamic>;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Assets.images.generateBill.svg(width: 230),
                    Text(
                      state.databaseEvent.snapshot.value.toString(),
                      style: TextStyle(
                          color: colorScheme.onSecondary, fontSize: 20),
                    ),
                    Column(
                      children: [
                        CustomTextfield(
                            controller: idController,
                            hintText: "Enter Farmer Id (fidXXX)",
                            obscureText: false),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextfield(
                            controller: quantityController,
                            hintText: "Enter Quantity (X-L)",
                            obscureText: false),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print("TEmp ${data["temp"]}");
                        try {
                          final dairy =
                              context.read<AuthCubit>().state.dairyInfo;
                          context.read<GenerateBillCubit>().generateBill(
                              ph: double.parse(data["ph"].toString()),
                              color: data["color"],
                              fat: data["fat"],
                              temp: int.parse(data["temp"].toString()),
                              farmerId: idController.text,
                              dairyId: dairy!.id!,
                              quantity: int.parse(quantityController.text));
                        } catch (e) {
                          print("THis is the exception $e");
                        }
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Center(
                          child: Text(
                            "Generate Bill",
                            style: TextStyle(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GenerateBillSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Assets.images.generateBill.svg(width: 230),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "DairyId: ${context.read<AuthCubit>().state.dairyInfo!.id}",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          "FarmerId: ${idController.text.toString()}",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          "Quality : ${state.quality}",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          "Quantity : ${quantityController.text.toString()} L",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          "Amount : ${state.tAmount} Rs",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ]),
                ],
              ),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
