import 'package:flutter/material.dart';
import 'package:my_project/add_item/add_item_screen.dart';
import 'package:my_project/dashboard/nav_bar.dart';
import 'package:my_project/favorite/favorite_model.dart';
import 'package:my_project/profile/user_model.dart';
import 'package:provider/provider.dart';
import 'add_item/Item_model.dart';
import 'dashboard/dashboard_screen.dart';
import 'splash/splash_screen.dart';
import 'login/login_screen.dart';
import 'signup/signup_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      // Start app with SplashScreen
      home: const SplashScreen(),

      // Define named routes for easy navigation
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/navbar': (context) => const NavBar(),
        '/add_item': (context) => const AddItemScreen(),
        // Add other routes as needed
      },
    );
  }
}