import 'package:flutter/material.dart';
import 'package:animated_list_item/animated_list_item.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  final List<String> skills = [
    "Développement Web :",
    "Développement Mobile :",
    "Base de Données :",
    "Conception :",
    "Langages de Programmation :",
    "Environnement Distribué :",
  ];

  final List<String> details = [
    "HTML, CSS, JavaScript, Angular, Laravel, VueJs, ASP.NET",
    "Flutter",
    "MySQL, SQL Server",
    "Modélisation UML, Design Patterns",
    "C, Java, Python",
    "Cloud, Docker",
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animationController.forward(); // Démarrer l'animation
  }

  @override
  void dispose() {
    _animationController.dispose(); // Nettoyage
    super.dispose();
  }

  Container item(int index) {
    return Container(
      color: Colors.indigo[100],
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skills[index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            details[index],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Compétences"),
        backgroundColor: Colors.teal[600],
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return AnimatedListItem(
            index: index,
            length: skills.length,
            aniController: _animationController,
            animationType: AnimationType.flipY, // Ou flipY, selon votre choix
            child: item(index),
          );
        },
      ),
    );
  }
}

enum AnimationType { flipX, flipY, fade }

class AnimatedListItem extends StatelessWidget {
  final int index;
  final int length;
  final AnimationController aniController;
  final AnimationType animationType;
  final Widget child;

  AnimatedListItem({
    required this.index,
    required this.length,
    required this.aniController,
    required this.animationType,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final startDelay = (index / length) * aniController.duration!.inMilliseconds;

    return AnimatedBuilder(
      animation: aniController,
      builder: (context, child) {
        final progress = aniController.value;

        double angle = progress * 2 * 3.141592653589793; // 360 degrés
        if (animationType == AnimationType.flipX) {
          angle *= -1; // Inverse le flip sur X
        }

        final animation = animationType == AnimationType.flipX
            ? Matrix4.rotationX(angle) // Animation de flip sur l'axe X
            : animationType == AnimationType.flipY
            ? Matrix4.rotationY(angle) // Animation de flip sur l'axe Y
            : Matrix4.identity(); // Pas de transformation

        return Transform(
          alignment: Alignment.center,
          transform: animation,
          child: Opacity(
            opacity: progress,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
