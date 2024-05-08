import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_poject_cv/bloc/theme_bloc.dart';
import 'package:my_poject_cv/pages/wassimCV.page.dart';
import 'package:my_poject_cv/pages/eyaCV.page.dart';
import 'package:my_poject_cv/pages/CVComplets.page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CV APPLICATION"),
        backgroundColor: Colors.white38,
        actions: [
          Switch(
            value: context.read<ThemeBloc>().state == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeBloc>().add(ThemeChanged(value));
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
           image: AssetImage("images/backg.jpg"),
           // image: AssetImage("images/backgHome.jpg"),
          // image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20.0),
            Center(
              child: Text(
                "Découvrez les profils de Wassim et Eya",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileButton(
                  context,
                  "Wassim",
                  "images/wassim.jpg",
                  WassimCVPage(),
                ),
                _buildProfileButton(
                  context,
                  "Eya",
                  "images/eya.jpg",
                  EyaCVPage(),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CVCompletsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Voir les CV complets",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileButton(BuildContext context, String name, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        height: 150.0,
        width: 150.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}