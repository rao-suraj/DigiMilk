import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridScreen extends StatelessWidget {
  final Items item1 = Items(
      title: "Dairy Details",
      subtitle: "Get the details of the\nmilk bought by dairy",
      event: "",
      img: "assets/images/notes.png");

  final Items item2 = Items(
    title: "Add Farmers",
    subtitle: "Add a new farmer",
    event: "",
    img: "assets/images/add_user.png",
  );
  final Items item3 = Items(
    title: "Farmers Details",
    subtitle: "Get list of Farmers",
    event: "",
    img: "assets/images/list.png",
  );

  final Items item4 = Items(
    title: "Generate Bill",
    subtitle: "Generate a new bill by\n getting the milk details",
    event: "",
    img: "assets/images/bill.png",
  );
  GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final appBrightmess = MediaQuery.of(context).platformBrightness;
    List<Items> myList = [item1, item2, item3, item4];

    return GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return InkWell(
            onTap: () {
              switch (data.title) {
                case "Dairy Details":
                  print(data.title);
                case "Add Farmers":
                  print(data.title);
                case "Generate Bill":
                  context.router.push(const GenereateBillRoute());
                case "Farmers Details":
                  print("Ell");
                  context.router.push(const FarmerDetailsRoute());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.97),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: appBrightmess == Brightness.dark
                        ? Colors.black.withOpacity(0.2)
                        : Colors.grey.shade300, // shadow color
                    spreadRadius: 5, // spread radius
                    blurRadius: 7, // blur radius
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: appTheme.colorScheme.onSecondary,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: appTheme.colorScheme.onSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          );
        }).toList());
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
