import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmerGridScreen extends StatelessWidget {
  final Items item1 = Items(
      title: "Milk Log",
      subtitle: "Get the details of the\nmilk sold to the dairy",
      event: "",
      img: "assets/images/notes.png");

  final Items item2 = Items(
    title: "Analysis",
    subtitle: "Milk Analysis",
    event: "",
    img: "assets/images/add_user.png",
  );
  FarmerGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final appBrightmess = MediaQuery.of(context).platformBrightness;
    List<Items> myList = [item1, item2];

    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16),
      itemCount: myList.length,
      itemBuilder: (context, item) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                switch (myList[item].title) {
                  case "Milk Log":
                    context.router.push(const MilkLogRoute());
                    print(myList[item].title);
                  case "Add Farmers":
                    print(myList[item].title);
                }
              },
              child: Container(
                height: 90,
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
                      spreadRadius: 5, // spread radius
                      blurRadius: 7, // blur radius
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Image.asset(
                            myList[item].img,
                            width: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              myList[item].title,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text(
                              myList[item].subtitle,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: appTheme.colorScheme.onSecondary,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text(
                              myList[item].event,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: appTheme.colorScheme.onSecondary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18)
          ],
        );
      },
    );
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
