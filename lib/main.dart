import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'pet_selection_screen.dart';
import 'home_screen.dart';
import 'pet_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adoptly',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      
      // Set the initial route to the onboarding screen
      initialRoute: '/',
      
      // Define the routes for navigation
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/pet_selection': (context) => const PetSelectionScreen(),
        '/home': (context) => const HomeScreen(),
      },
      
      // Handle dynamic route arguments for pet detail screen
      onGenerateRoute: (settings) {
        if (settings.name == '/pet_detail') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return PetDetailScreen(
                petName: args['name'] as String,
                petImage: args['image'] as String,
                petDistance: args['distance'] as String,
                petType: args['type'] as String? ?? '',
              );
            },
          );
        }
        return null;
      },
    );
  }
}