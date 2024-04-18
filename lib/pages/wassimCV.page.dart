import 'package:flutter/material.dart';
import 'package:my_poject_cv/menu/bottom_bar.dart';
import 'package:scale_button/scale_button.dart';

class WassimCVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BIENVENUE CHEZ WASSIM CV"),
      ),
      body: Center( // Utilisez un widget Center pour centrer les boutons horizontalement
        //child:BottomBar(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleButton(
              child: Container(
                height: 48.0,
                width: 300.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
                child: Text(
                  "PROFIL",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            ScaleButton(
              reverse: true,
              child: Container(
                height: 48.0,
                width: 300.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
                child: Text(
                  "FORMATION",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 14.0),

            ScaleButton(
              reverse: true,
              child: Container(
                height: 48.0,
                width: 300.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
                child: Text(
                  "EXPERIENCE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            ScaleButton(
              reverse: true,
              child: Container(
                height: 48.0,
                width: 300.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
                child: Text(
                  "PROJETS",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
           // BottomBar()
          ],
        ),


      ),
    );
  }
}