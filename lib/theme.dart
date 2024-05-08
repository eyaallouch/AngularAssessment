import 'package:flutter/material.dart';

ThemeData lightTheme=ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme
);
ThemeData darkTheme=ThemeData(
  useMaterial3: true,
  colorScheme: darkColorSchema
);

const darkColorSchema = ColorScheme.dark(
  primary: Color(0xFF2196F3),
  secondary: Color(0xFFFF5722),
  background: Color(0xFF212121),
  surface: Color(0xFF424242),
  onBackground: Colors.black,
  onSurface: Colors.blueAccent,
  error: Colors.red,
  onError: Colors.white10,
  brightness: Brightness.dark,
  onSurfaceVariant:Colors.purple,
);


const lightColorScheme=ColorScheme (
   
      brightness: Brightness.light,
      primary: Color(4284831119),
      surfaceTint: Color(4284960932),
      onPrimary: Color(-1),
      primaryContainer: Color(4293582335),
      onPrimaryContainer: Color(4280352861),
      secondary: Color(4284636017),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293451512),
      onSecondaryContainer: Color(4280097067),
      tertiary: Color(4286403168),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957284),
      onTertiaryContainer: Color(4281405725),
      error: Color(4289930782),
      onError: Color(4294967295),
      errorContainer: Color(4294565596),
      onErrorContainer: Color(4282453515),
      background: Color(-1),
      onBackground: Color(4280097568),
      surface: Color(4294899711),
      onSurface: Color(4280097568),
      surfaceVariant: Color(4293386476),
      onSurfaceVariant: Color(4282991951),
      outline: Color(4286149758),
      outlineVariant: Color(4291478736),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      onInverseSurface: Color(4294307831),
      inversePrimary: Color(4291869951),

    );
  
  
