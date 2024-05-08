import 'dart:math';

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_poject_cv/models/category.dart';
import 'package:my_poject_cv/pages/eya_details/competence.page.dart';
import 'package:scroll_cool_widget/button_position.dart';
import 'package:scroll_cool_widget/scroll_cool_widget.dart';
class ExperienceEya extends StatefulWidget {
  @override
  State<ExperienceEya> createState() => _ExperienceEyaState();
}

class _ExperienceEyaState extends State<ExperienceEya> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Mes expériences",
          style: TextStyle(
            fontWeight: FontWeight.w600, // Texte en gras
          ),
        ),
      ),
      body:    GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 24,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categoryList[index],
          );
        },
        itemCount: categoryList.length,
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 4.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            category.thumbnail,
            width: 150, // Définissez la largeur souhaitée
            height: 100, // Définissez la hauteur souhaitée
            fit: BoxFit.cover, // Ajustement de l'image
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              category.name,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                // Ajoutez d'autres propriétés de style selon votre préférence
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox( height: 8),
          Center(
            child: Text(
              "${category.technologies}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}