import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:dhood_app/presentation/cubit/dairy_details_cubit/dairy_details_cubit.dart';
import 'package:dhood_app/presentation/cubit/dairy_details_cubit/dairy_detials_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class DairyDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  const DairyDetailsScreen({super.key});

  @override
  State<DairyDetailsScreen> createState() => _DairyDetailsState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final dairy = context.read<AuthCubit>().state.dairyInfo!;
    return BlocProvider(
      create: (_) => getIt<DairyDetailsCubit>()..getDairyDetails(id: dairy.id!),
      child: this,
    );
  }
}

class _DairyDetailsState extends State<DairyDetailsScreen> {
  List<String> quality = ["Average","Good","Great"];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appBrightmess = MediaQuery.of(context).platformBrightness;
    final appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Dairy Details"),
      ),
      backgroundColor: colorScheme.background,
      body: Center(
        child: BlocBuilder<DairyDetailsCubit, DairyDetailsState>(
          builder: (context, state) {
            if (state is DairyDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DairyDetailsSuccrss) {
              final data = state.dairyDetails;
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Farmer id: ${data[index].farmerId}",
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
                                            color: appTheme
                                                .colorScheme.onSecondary,
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
                                            color: appTheme
                                                .colorScheme.onSecondary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                                Text(
                                  "Quantity: ${data[index].quantity} L",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color:
                                              appTheme.colorScheme.onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  "Amount: ${data[index].totAmount} Rs",
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color:
                                              appTheme.colorScheme.onSecondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is DairyDetailsError) {
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
