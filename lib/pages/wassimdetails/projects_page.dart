import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final String keywords;
  final String details;

  Project({
    required this.title,
    required this.description,
    required this.keywords,
    required this.details,
  });
}

class ProjectsPage extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: "Jabeur Location",
      description: "Une plateforme de location de voitures avec tableau de bord administrateur.",
      keywords: "Laravel, VueJs, MySQL, REST",
      details:
      "Une plateforme qui permet aux utilisateurs de s'inscrire, de filtrer les voitures par date et de payer.",
    ),
    Project(
      title: "Suivi des dépenses",
      description: "Un outil de suivi des dépenses et revenus avec tableau de bord.",
      keywords: "ASP.NET, MySQL, Git",
      details: "Suivi des dépenses via un tableau de bord en utilisant ASP.NET Core et MySQL.",
    ),
    Project(
      title: "Model ML prédictif",
      description: "Projet de Machine Learning pour l'analyse des données d'assurance.",
      keywords: "Python, Machine Learning",
      details:
      "Effectué une analyse exploratoire sur un ensemble de données d'assurance et créé un modèle prédictif en appliquant différents algorithmes d'apprentissage automatique tels que la forêt aléatoire, etc.",
    ),
    Project(
      title: "Stage d’initiation en ASM",
      description: "Développement d'une application avec Laravel et Angular.",
      keywords: "Angular, Laravel, Git",
      details:
      "Comprendre les frameworks Laravel et Angular, puis développer une application e-commerce.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projets"),
        backgroundColor: Colors.teal, // Couleur de l'AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // Couleur de fond de la page
        ),
        child: ListWheelScrollView(
          itemExtent: 250,
          physics: FixedExtentScrollPhysics(),
          perspective: 0.006,
          children: projects.map((project) => buildCard(context, project)).toList(),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, Project project) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      color: Colors.green[100], // Couleur de fond de la carte

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              project.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              project.description,
              style: const TextStyle(fontSize: 16, color: Colors.indigo),
            ),
            const SizedBox(height: 10),
            Text(
              "Mots clés : ${project.keywords}",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            ElevatedButton(
              onPressed: () {
                _showProjectDetails(context, project.details); // Fonction appelée lors du clic
              },
              child: const Text("En savoir plus"),
            ),
          ],
        ),
      ),
    );
  }

  void _showProjectDetails(BuildContext context, String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Détails du projet"),
          content: Text(details),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
