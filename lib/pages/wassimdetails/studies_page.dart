import 'package:flutter/material.dart';

class Study {
  final String title;
  final String institution;
  final String location;
  final String dates;
  final String description;
  final String imagePath; // Pour l'image associée à chaque étude

  Study({
    required this.title,
    required this.institution,
    required this.location,
    required this.dates,
    required this.description,
    required this.imagePath,
  });
}

class StudiesPage extends StatelessWidget {
  final List<Study> studies = [
    Study(
      title: "Diplôme d’ingénieur en génie informatique",
      institution: "Institut international de technologie - IIT",
      location: "SFAX, Tunisie",
      dates: "09/2022 – 06/2025",
      description: "Étudiant en deuxième année de génie informatique avec des cours axés sur le développement logiciel et l'intelligence artificielle.",
      imagePath: 'images/iit1.jpg', // Chemin vers l'image
    ),
    Study(
      title: "Section Mathématiques Physiques",
      institution: "Institut préparatoire aux études d'ingénieur de Sfax",
      location: "SFAX, Tunisie",
      dates: "2021 – 2022",
      description: "Étudiant en deuxième année préparatoire en section mathématiques et physiques.",
      imagePath: 'images/ipeis.jpg',
    ),
    Study(
      title: "Section Mathématiques Physiques",
      institution: "Institut préparatoire aux études d'ingénieur de Gabès",
      location: "GABES, Tunisie",
      dates: "2020 – 2021",
      description: "Étudiant en première année préparatoire en section mathématiques et physiques.",
      imagePath: 'images/ipeig.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Études"),
        backgroundColor: Colors.teal[600],
      ),
      body: ListView.builder(
        itemCount: studies.length,
        itemBuilder: (context, index) {
          return buildStudyCard(context, studies[index]);
        },
      ),
    );
  }

  Widget buildStudyCard(BuildContext context, Study study) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 8, // Augmentation de l'élévation pour un effet 3D
      shadowColor: Colors.purple.withOpacity(0.5), // Ombre pour la profondeur
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Bordures plus arrondies
      ),
      child: InkWell(
        onTap: () {
          _showStudyDetails(context, study); // Permet d'ajouter de l'interaction
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Bordure arrondie en haut
              child: Image.asset(
                study.imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover, // Ajuste l'image à la taille du conteneur
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    study.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${study.institution}, ${study.location}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.pink[700], // Plus de contraste
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    study.dates,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[600], // Légère différence
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showStudyDetails(BuildContext context, Study study) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(study.title),
          content: Text(study.description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
