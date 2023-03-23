import 'package:arcore_example/views/localAndWebObjectsView.dart';
import 'package:flutter/material.dart';

import 'QRCodeScannerScreen.dart';
import 'Signup.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body : Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/StockCafe.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
              margin: EdgeInsets.fromLTRB(0,screenHeight * 0.57, 0, 0),
              child:  const Text(
                "Visualisez vos prdouits",
                 style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(screenWidth * 0.10,screenHeight * 0.025, screenWidth * 0.10, screenHeight * 0.1),
                  child:  const Text(
                    "Bonjour Simon, vous pouvez désormais utiliser la fonciton Réalité Augmentée de l'applicaiton. Visualisez en 3D l'intégration des produits de votre catlaogue à votre environnement.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),)
              ),
              Container(
                child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenWidth * 0.04, screenWidth * 0.04, screenWidth * 0.04),
                          onPrimary: Colors.black, // Background color
                          primary: Colors.white, // Text Color (Foreground color)
                          shape: CircleBorder()
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRCodeScannerScreen()));
                      },
                      child:  const Text(
                          ">>",)),
                ),
              ),
            ],
          ),
        )


        );
  }
}
