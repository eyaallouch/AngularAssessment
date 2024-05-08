import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_poject_cv/bloc/theme_bloc.dart';
import 'package:my_poject_cv/theme.dart';

import 'menu/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retourne un Scaffold avec un Text au centre
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            themeMode: state,
          //  themeMode: ThemeMode.dark,
            //darkTheme: darkTheme,
            darkTheme: ThemeData(
              colorScheme: darkColorSchema,
              iconTheme: IconThemeData(
                  color: Colors
                      .black), // Définir la couleur des icônes en mode sombre
              // Autres configurations...
            ),

            home: Scaffold(

              body: Center(child: BottomBar()),
            ),
          );
        },
      ),
    );
  }
}
