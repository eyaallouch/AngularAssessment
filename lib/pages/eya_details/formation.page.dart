import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_poject_cv/pages/eya_details/card_formation.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class FormationEya extends StatelessWidget {
  List<TimelineModel> items = [
    TimelineModel(
      CardFormation('images/iit.png', '2022-2025',
          'Etudiante en génie Logiciel et Informatique décisionnelle'),
      position: TimelineItemPosition.left,
      iconBackground: Colors.green,
      icon: Icon(Icons.school),
    ),
    TimelineModel(
      CardFormation('images/fac_de_science.jpg', '2020-2022',
          'Cycle Préparatoire Math-Physique'),
      position: TimelineItemPosition.right,
      iconBackground: Colors.redAccent,
      icon: Icon(Icons.school),
    ),
    TimelineModel(
      CardFormation('images/lycee_megdich.jpg', '2016-2020',
          'Baccalauréat en mathématiques'),
      position: TimelineItemPosition.left,
      iconBackground: Colors.blue,
      icon: Icon(Icons.school),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes formations",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            // Texte en gras
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Timeline(
                children: items,
                position: TimelinePosition.Center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
