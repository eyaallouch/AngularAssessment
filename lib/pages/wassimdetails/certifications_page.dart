import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CertificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Certifications"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildCertificationCard(
              title: "Cisco Certified Network Associate",
              imagePath: "images/cisco.jpg",
              description: "Certification pour les compétences en réseautage",
            ),
            const SizedBox(height: 14.0),
            _buildCertificationCard(
              title: "Scrum Fundamentals",
              imagePath: "images/scrum.jpg",
              description: "Certification pour les bases du Scrum",
            ),
          ],
        ).animate().fade(duration: const Duration(seconds: 1)),
      ),
    );
  }

  // Fonction pour construire une carte avec le texte sous l'image
  Widget _buildCertificationCard({
    required String title,
    required String imagePath,
    required String description,
  }) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Correction de l'erreur de frappe
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Correction de l'erreur de frappe
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black38
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
