import 'package:daily_dish/screens/finish_screen.dart';
import 'package:daily_dish/screens/home_screen.dart';
import 'package:daily_dish/screens/ingredients_screen.dart';
import 'package:daily_dish/screens/recipe_screen.dart';
import 'package:daily_dish/screens/sign_in_screen.dart';
import 'package:daily_dish/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Dish',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/recipe': (context) => const RecipeScreen(),
        '/ingredients': (context) => const IngredientsScreen(),
        '/all-done': (context) => const AllDoneScreen(),
      },
    );
  }
}
