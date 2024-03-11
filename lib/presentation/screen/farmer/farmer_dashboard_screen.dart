
import 'package:auto_route/annotations.dart';
import 'package:dhood_app/presentation/screen/widget/farmer_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class FarmerDashboardScreen extends StatefulWidget {
  const FarmerDashboardScreen({super.key});

  @override
  FarmerDashboardState createState() => FarmerDashboardState();
}

class FarmerDashboardState extends State<FarmerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme= Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 30,
            child: Padding(
              padding:const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Johny s Family",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: appTheme.colorScheme.onSecondary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Image.asset(
                      "assets/images/entrepreneur.png",
                      width: 50,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
         Expanded(flex: 70,child: FarmerGridScreen())
        ],
      ),
    );
  }
}
