import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            flex: 50,
            child: Center(
              child: Image.asset(
                "assets/images/welcome_back.png",
                height: 140,
              ),
              // child: Container(),
            ),
          ),
          Expanded(
            flex: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      // maximumSize: const Size(50, 50)
                    ),
                    onPressed: () {
                      context.pushRoute(DairyLoginRoute());
                    },
                    child: Text(
                      "Dairy Worker",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    )),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  onPressed: () {
                    context.pushRoute( FarmerLoginRoute());
                  },
                  child: Text(
                    "Farmer",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
