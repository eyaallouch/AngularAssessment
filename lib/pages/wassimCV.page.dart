import 'package:flutter/material.dart';
import './wassimdetails/certifications_page.dart';
import './wassimdetails/contact_page.dart';
import './wassimdetails/Language_page.dart';
import './wassimdetails/projects_page.dart';
import './wassimdetails/skills_page.dart';
import './wassimdetails/studies_page.dart';


class WassimCVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV de Wassim',
      theme: ThemeData(
       // primarySwatch: Colors.indigo,
          primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Je suis Wassim!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Etudiant en 2éme année génie informatique!',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/wassim.jpg'),  // Modifiez cette ligne selon votre image
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Compétences', Icons.star, Colors.blue, SkillsPage()),
                  itemDashboard('Langues', Icons.language , Colors.green, LanguagePage()),
                  itemDashboard('Études', Icons.library_books, Colors.orange, StudiesPage()),
                  itemDashboard('Projets', Icons.folder, Colors.purple, ProjectsPage()),
                  itemDashboard('Contact', Icons.contact_mail, Colors.red, ContactPage()),
                  itemDashboard('Certifications', Icons.verified, Colors.greenAccent, CertificationsPage()),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemDashboard(String title, IconData icon, Color color, Widget destination) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    ),
  );
}
