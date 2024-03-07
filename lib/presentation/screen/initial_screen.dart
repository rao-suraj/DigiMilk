import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            flex: 60,
            child: Container(),
          ),
          Expanded(
              flex: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Dairy Worker",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Farmer",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
