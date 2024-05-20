import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_flutter/provider/count_provider.dart';
import 'package:provider_flutter/provider/favourite_provider.dart';
import 'package:provider_flutter/provider/slider_color_change_provider.dart';
import 'package:provider_flutter/provider/theme_changer_provider.dart';

import 'example_screens/theme/dark_theme_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderColorChangeProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        //Initialize ThemeChanger Provider Class
        final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

          //Add Provider for Theme Mode
          themeMode: themeChangerProvider.themeMode,

          //Themes Demo  For Light Mode
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.light(
              primary: Colors.lightBlueAccent,
             ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue
            ),
            useMaterial3: true,
          ),

          //Themes Demo For Dark Mode
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: const ColorScheme.dark(
              primary: Colors.red
            ),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.red
            ),
            useMaterial3: true,
          ),

          home: const DarkThemeScreen(),
        );
      }),
    );
  }
}
