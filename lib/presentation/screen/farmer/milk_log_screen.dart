import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:dhood_app/presentation/cubit/milk_log_cubit/milk_log_cubit.dart';
import 'package:dhood_app/presentation/cubit/milk_log_cubit/milk_log_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class MilkLogScreen extends StatefulWidget implements AutoRouteWrapper {
  const MilkLogScreen({super.key});

  @override
  State<MilkLogScreen> createState() => _MilkLogState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final farmer = context.read<AuthCubit>().state.farmerInfo!;
    return BlocProvider(
      create: (_) => getIt<MilkLogCubit>()..getMilklog(id: farmer.id!),
      child: this,
    );
  }
}

class _MilkLogState extends State<MilkLogScreen> {
  List<String> quality = ["Average","Good","Great"];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appBrightmess = MediaQuery.of(context).platformBrightness;
    final appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Milk Log"),
      ),
      backgroundColor: colorScheme.background,
      body: Center(
        child: BlocBuilder<MilkLogCubit, MilkLogState>(
          builder: (context, state) {
            if (state is MilkLogLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MilkLogSuccrss) {
              final data = state.milkLog;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.97),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: appBrightmess == Brightness.dark
                                    ? Colors.black.withOpacity(0.2)
                                    : Colors.grey.shade300, // shadow color
                                spreadRadius: 2, // spread radius
                                blurRadius: 10, // blur radius
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Dairy id: ${data[index].dairyId}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Date: ${data[index].date}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: appTheme.colorScheme.onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Quality: ${quality[data[index].quality]}",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: appTheme.colorScheme.onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                             
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Quantity: ${data[index].quantity} L",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: appTheme.colorScheme.onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Amount: ${data[index].totAmount} Rs",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: appTheme.colorScheme.onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is MilkLogError) {
              return Text(state.message);
            } else {
              return const Center(
                child: Text("Some thing went wrong"),
              );
            }
          },
        ),
      ),
    );
  }
}
