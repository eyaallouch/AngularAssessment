import 'package:flutter/material.dart';
import 'package:my_poject_cv/pages/eya_details/formation.page.dart';
import 'package:my_poject_cv/pages/home.page.dart';
//import 'package:my_poject_cv/pages/wassim_page.dart'; // Importez la page WassimPage
import 'package:scale_button/scale_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class EyaCVPage extends StatefulWidget {
  @override
  State<EyaCVPage> createState() => _EyaCVPageState();
}

class _EyaCVPageState extends State<EyaCVPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final double coverHeight = 220;
  final double profileHeight = 130;

  @override
  Widget build(BuildContext context) {
    final top = 200.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverImage(),
                Positioned(
                  top: top,
                  child: buildProfileImage(),
                ),
              ],
            ),
            SizedBox(height: 80),
            navbar(),
            SizedBox(height: 16),
            Container(
              height: MediaQuery.of(context).size.height, // Utilisez la hauteur totale de l'écran pour le PageView
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  FormationEya(),
                  HomePage(),
                 // WassimPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: ClipRect(
      child: Transform.translate(
        offset: Offset(0.0, 15.0), // Ajustez cette valeur pour masquer plus ou moins de la partie inférieure de l'image
        child: Image.network(
          // URL de votre image
          'https://www.shutterstock.com/image-vector/engineer-word-modern-typography-design-260nw-1954615162.jpg',
          width: double.infinity,
          height: coverHeight + 50.0, // Ajustez cette valeur pour compenser la translation
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  Widget buildProfileImage() => Row(
    children: [
       CircleAvatar(
          radius: profileHeight/ 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage('images/eya.jpg'),
        ),

      Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Étudiante en 2ème année',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'de Génie Logiciel et Informatique Décisionnelle',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget navbar() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(180 * 3.1415927 / 1),
      child: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        items: <Widget>[
          Icon(Icons.cases_rounded, size: 30, color: _selectedIndex == 0 ? Colors.deepPurple.shade300 : null),
          Icon(Icons.cast_for_education, size: 30, color: _selectedIndex == 1 ? Colors.deepPurple.shade300 : null),
          Icon(Icons.devices_outlined, size: 30, color: _selectedIndex == 2 ? Colors.deepPurple.shade300 : null),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }
}
