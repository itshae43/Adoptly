import 'package:flutter/material.dart';
import 'discover_screen.dart';

class PetSelectionScreen extends StatelessWidget {
  const PetSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What are you looking for?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "Select the type of pet you'd like to explore",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            
            // Pet selection cards
            PetTypeCard(
              petType: 'Dog',
              icon: Icons.pets,
              color: const Color(0xFFE6E6FA),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiscoverScreen(petType: 'Dog'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            
            PetTypeCard(
              petType: 'Cat',
              icon: Icons.pets,
              color: const Color(0xFFFDEEF4),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiscoverScreen(petType: 'Cat'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            
            PetTypeCard(
              petType: 'Other',
              icon: Icons.cruelty_free,
              color: const Color(0xFFE8FADF),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiscoverScreen(petType: 'Other'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PetTypeCard extends StatelessWidget {
  final String petType;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const PetTypeCard({
    super.key,
    required this.petType,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                size: 40,
                color: const Color(0xFFE91E63),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              petType,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
