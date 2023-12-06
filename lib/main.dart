import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/home_screen.dart';
import 'package:provider_project/provider/auth_provider.dart';
import 'package:provider_project/provider/count_provider.dart';
import 'package:provider_project/provider/example_one_provider.dart';
import 'package:provider_project/provider/favorite_provider.dart';
import 'package:provider_project/provider/theme_changer_provider.dart';
import 'package:provider_project/screens/count_example.dart';
import 'package:provider_project/screens/example_one.dart';
import 'package:provider_project/screens/login_screen.dart';
import 'package:provider_project/statful_widget_screen.dart';
import 'package:provider_project/why_provider.dart';

import 'favorite/dark_theme.dart';
import 'favorite/favorite_screen.dart';

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
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context){
          final themeProvider = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            themeMode:themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.teal,
              appBarTheme: AppBarTheme(
                color: Colors.teal
              ),
              primaryColor: Colors.teal,
              iconTheme: IconThemeData(
                color: Colors.red
              )
            ),
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          );
        })
    );
  }
}
