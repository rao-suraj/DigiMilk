import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/gen/assets.gen.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class BillScreen extends StatelessWidget {
  final String dairyId;
  final String farmerId;
  final String quality;
  final String quantity;
  final int amount;

  const BillScreen(
      {super.key,
      required this.dairyId,
      required this.farmerId,
      required this.quality,
      required this.quantity,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Assets.images.generateBill.svg(width: 230),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                "DairyId: $dairyId",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              Text(
                "FarmerId: $farmerId",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              Text(
                "Quality : $quality",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              Text(
                "Quantity : $quantity L",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              Text(
                "Amount : $amount Rs",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 25,),
              GestureDetector(
                onTap: () {
                  context.replaceRoute(const DairyDashboardRoute());
                },
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
