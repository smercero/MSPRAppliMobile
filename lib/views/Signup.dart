import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';
  final requestBody = {'title': 'Updated Title', 'body': 'Updated body'};
  String _response = '';

  Future<void> _makePutRequest() async {
    try {
      final response = await http.put(Uri.parse(apiUrl),
          body: json.encode(requestBody),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          _response = responseData.toString();
        });
      } else {
        setState(() {
          _response = 'Request failed with status: ${response.statusCode}.';
        });
      }
    } catch (error) {
      setState(() {
        _response = 'Error occurred: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body : Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/FondInscription.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0,screenHeight * 0.4, 0, screenHeight * 0.045),
                    child:  const Text(
                        "Authentification                 ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white)
                    ),
                  ),
                  BlurryContainer(
                      blur: 7,
                      width: screenWidth * 0.90,
                      height: screenHeight * 0.45,
                      elevation: 0,
                      color: Colors.grey.withOpacity(0.2),
                      padding: const EdgeInsets.all(18),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child:  Column(
                          children: [
                            Text(_response),
                            const Text(
                                "Authentifiez vous pour pouvoir \nvisualiser en 3D les produits de votre catalogue vendeur.",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white)
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: SizedBox(
                                width: screenWidth, // <-- Your width
                                height: screenHeight * 0.065, // <-- Your height
                                child: TextFormField(
                                style: TextStyle(fontSize: 13),
                              decoration:  InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.orange),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                hintText: 'ex : vendeur1@entreprise.fr',
                                labelText: 'Adresse e-mail',
                                filled: true,
                                fillColor: Colors.white,

                              ),
                            ),
                  ),
    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: SizedBox(
                          width: screenWidth, // <-- Your width
                          height: screenHeight * 0.065, // <-- Your height
                          child: TextFormField(
                              style: TextStyle(fontSize: 13),
                              decoration:  InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.orange),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                labelText: 'Prenom',
                                filled: true,
                                fillColor: Colors.white,

                              ),
                            ),
                  ),
           ),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
                          child: SizedBox(
                              width: screenWidth, // <-- Your width
                              height: screenHeight * 0.065, // <-- Your height
                              child: TextFormField(
                              style: TextStyle(fontSize: 14),
                              decoration:  InputDecoration(

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.orange),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                labelText: 'Nom',
                                filled: true,
                                fillColor: Colors.white,

                              ),
                            ),),
                      ),
                            SizedBox(
                              width: 800, // <-- Your width
                              height: screenHeight * 0.065, // <-- Your height
                              child: ElevatedButton(
                              child: Text('Valider et poursuivre'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12), // <-- Radius
                                ),
                                padding: const EdgeInsets.all(0),
                                primary: Colors.orange[500],
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize:15,
                                    fontStyle: FontStyle.normal),
                              ),
                                onPressed: _makePutRequest,
                            ),
                  ),
                          ])
                  ),

                ])
        ));
  }


}
