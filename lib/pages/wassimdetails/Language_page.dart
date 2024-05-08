import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animation_list/flutter_animation_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:scroll_cool_widget/scroll_cool_widget.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page des Langues',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguagePage(),
    );
  }
}
class LanguagePage  extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _CompetenceEyaState();
}

class _CompetenceEyaState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> competences = [
      {"name": AssetImage("images/france.jpg"), "rating": 4.0},
      {"name": AssetImage("images/tunisie.jpg"), "rating": 5.0},
      {"name":AssetImage("images/uk.jpg"), "rating": 3.0},

    ];

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Mes Compétences",
          style: TextStyle(
            fontWeight: FontWeight.w600, // Texte en gras
          ),
        ),
        backgroundColor: Colors.teal[600],

      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: AnimationList(
                duration: 6000,
                children: competences.map((competence) {
                  return _buildTile(competence["name"], competence["rating"]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(ImageProvider image, double rating) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.grey[300],
        border: Border.all(color: Colors.grey.shade50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: 100,  // Définir la largeur souhaitée de l'image
                height: 80, // Définir la hauteur souhaitée de l'image
                child: Image(
                  image: image,
                  fit: BoxFit.cover, // Ajuster l'image pour couvrir la boîte
                ),
              ),
            ),
            _RatingBar(rating),
          ],
        ),
      ),
    );
  }



  Widget _RatingBar(double note) {
    return RatingBar.builder(
      initialRating: note,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.cyan,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
      // Supprimer onRatingUpdate rend le RatingBar statique
    );
  }
}
