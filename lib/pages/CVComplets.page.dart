import 'package:flutter/material.dart';

class CVCompletsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV Complets"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CV Complets",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Voici les CV complets de Wassim et Eya:",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour afficher le CV complet de Wassim
              },
              child: Text("Voir le CV complet de Wassim"),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Logique pour afficher le CV complet de Eya
              },
              child: Text("Voir le CV complet de Eya"),
            ),
          ],
        ),
      ),
    );
  }
}