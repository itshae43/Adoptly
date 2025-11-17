import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
             Text(
              "PawDream",
              style: GoogleFonts.poppins(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 60),
            const Image(
              height: 400,
              width: 400,
              image: AssetImage('assets/images/onbordingpets.png'),
            ),
            // Bottom pink card
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                decoration: const BoxDecoration(
                  color: Color(0xFFE91E63),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    // Main Title
                    Text(
                      "Find a Little Friend",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    // Subtitle/Description
                    Text(
                      "Discover your perfect companion. Connect with adorable pets looking for their forever home.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFFE91E63),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/main');
                        },
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
