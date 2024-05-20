import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/example_screens/favourite/favourite_screen.dart';
import 'package:provider_flutter/example_screens/sliderColor_change_example.dart';
import 'package:provider_flutter/provider/count_provider.dart';
import 'package:provider_flutter/provider/favourite_provider.dart';
import 'package:provider_flutter/provider/slider_color_change_provider.dart';

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
      ],

      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  const FavouriteScreen(),
      ) ,
    );



  }
}
