import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animation_list/flutter_animation_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:scroll_cool_widget/scroll_cool_widget.dart';
class CompetenceEya extends StatefulWidget {
  const CompetenceEya({super.key});

  @override
  State<CompetenceEya> createState() => _CompetenceEyaState();
}

class _CompetenceEyaState extends State<CompetenceEya> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> competences = [
      {"name": "Angular", "rating": 2.0},
      {"name": "Laravel", "rating": 4.0},
      {"name": "VueJs", "rating": 4.0},
      {"name": "Flutter", "rating": 3.0},
      {"name": "Java", "rating": 3.0},
      {"name": "Python", "rating": 3.0},
    ];

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Mes Compétences",
            style: TextStyle(
          fontWeight: FontWeight.w600, // Texte en gras
        ),
        ),

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

  Widget _buildTile(String title, double rating) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.teal.shade100,
        border: Border.all(color: Colors.grey.shade50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w800, // Texte en gras
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
        color: Colors.yellow[800],
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
      // Supprimer onRatingUpdate rend le RatingBar statique
    );
  }
}
