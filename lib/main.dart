import 'package:flutter/material.dart';

import 'menu/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retourne un Scaffold avec un Text au centre
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:BottomBar()
        ),
      ),
    );
  }
}
