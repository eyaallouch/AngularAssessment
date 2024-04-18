
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:scale_button/scale_button.dart';

class EyaCVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BIENVENUE CHEZ EYA CV"),
      ),
      body: Stack( // Utilisez un widget Stack pour superposer le CurvedNavigationBar sur la colonne de boutons
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleButton(
                  child: Container(
                    height: 48.0,
                    width: 300.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: Text(
                      "PROFIL",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 14.0),
                ScaleButton(
                  reverse: true,
                  child: Container(
                    height: 48.0,
                    width: 300.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: Text(
                      "FORMATION",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 14.0),
                ScaleButton(
                  reverse: true,
                  child: Container(
                    height: 48.0,
                    width: 300.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: Text(
                      "EXPERIENCE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 14.0),
                ScaleButton(
                  reverse: true,
                  child: Container(
                    height: 48.0,
                    width: 300.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: Text(
                      "PROJETS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned( // Utilisez Positioned pour positionner le CurvedNavigationBar en bas de l'écran
            left: 0,
            right: 0,
            bottom: 0,
            child: CurvedNavigationBar(
              backgroundColor: Colors.blueAccent,
              items: [
                Icon(Icons.home, color: Colors.white),
                Icon(Icons.search, color: Colors.white),
                Icon(Icons.settings, color: Colors.white),
              ],
              onTap: (index) {
                // Ajoutez votre logique pour changer de page ici
              },
            ),
          ),
        ],
      ),
    );
  }
}