import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // This Expanded section holds the title and image
          Expanded(
            flex: 3, // Gives more space to the image area
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60), // Space from status bar
                
                // The "Adoptly" Title
                const Text(
                  "Adoptly",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE91E63), // Pink color
                  ),
                ),
                
                const SizedBox(height: 20),

                // Your pet image
                // Make sure you added 'assets/images/pets.png' to your pubspec.yaml
                Image.asset(
                  'assets/images/onbordingpets.png',
                  height: 300, // Adjust height as needed
                ),
              ],
            ),
          ),

          // This is the pink card at the bottom
          Container(
            height: 320, // Adjust height as needed
            padding: const EdgeInsets.all(32.0),
            decoration: const BoxDecoration(
              color: Color(0xFFE91E63), // Main pink color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                const Text(
                  "Find a Little Friend",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                const Text(
                  "Find a Little FriendFind a Little FriendFind a Little FriendFind a Little FriendFind a Little Friend",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70, // Lighter white
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Get Started Button
                SizedBox(
                  width: double.infinity, // Make button stretch
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: const Color(0xFFE91E63), // Button text/icon color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Pet Selection Screen
                      Navigator.pushReplacementNamed(context, '/pet_selection');
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}