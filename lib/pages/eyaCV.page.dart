import 'package:flutter/material.dart';
import 'package:my_poject_cv/pages/eya_details/competence.page.dart';
import 'package:my_poject_cv/pages/eya_details/experience.page.dart';
import 'package:my_poject_cv/pages/eya_details/formation.page.dart';
import 'package:my_poject_cv/pages/eya_details/langues.page.dart';
import 'package:scale_button/scale_button.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EyaCVPage extends StatelessWidget {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

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
            SizedBox(height: 100),
            navbar(),
            Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _selectedIndex = index;
                },
                children: [
                  LanguesEya(),
                  ExperienceEya(),
                  FormationEya(),
                  CompetenceEya(),

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
        offset: Offset(0.0, 15.0),
        child: Image.network(
          'https://www.shutterstock.com/image-vector/engineer-word-modern-typography-design-260nw-1954615162.jpg',
          width: double.infinity,
          height: coverHeight + 50.0,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  Widget buildProfileImage() => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage('images/eya.jpg'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.0),
            Text(
              'Étudiante en 2ème année',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.teal,
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
          Icon(Icons.abc,size: 30),
          Icon(Icons.cases_rounded, size: 30),
          Icon(Icons.cast_for_education, size: 30),
          Icon(Icons.devices_outlined, size: 30),

        ],
        onTap: (index) {
          _selectedIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
