import 'package:flutter/material.dart';
import 'discover_screen.dart';
import 'liked_pets_screen.dart';
import 'widgets/modern_bottom_nav_bar.dart';

class MainNavigation extends StatefulWidget {
  final String? initialPetType;
  final int initialIndex;

  const MainNavigation({
    super.key,
    this.initialPetType,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  late String _selectedPetType;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _selectedPetType = widget.initialPetType ?? 'Dog';
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPetTypeSelected(String petType) {
    setState(() {
      _selectedPetType = petType;
      _currentIndex = 1; // Navigate to discover screen
    });
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: const NeverScrollableScrollPhysics(), // Disable swipe to change pages
            children: [
              PetSelectionScreenWrapper(
                onPetTypeSelected: _onPetTypeSelected,
              ),
              DiscoverScreen(petType: _selectedPetType),
              const LikedPetsScreen(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ModernBottomNavBar(
              currentIndex: _currentIndex,
              onTap: _onNavItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}

// Wrapper for PetSelectionScreen to handle navigation
class PetSelectionScreenWrapper extends StatelessWidget {
  final Function(String) onPetTypeSelected;

  const PetSelectionScreenWrapper({
    super.key,
    required this.onPetTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              onTap: () => onPetTypeSelected('Dog'),
            ),
            const SizedBox(height: 20),
            
            PetTypeCard(
              petType: 'Cat',
              icon: Icons.pets,
              color: const Color(0xFFFDEEF4),
              onTap: () => onPetTypeSelected('Cat'),
            ),
            const SizedBox(height: 20),
            
            PetTypeCard(
              petType: 'Other',
              icon: Icons.cruelty_free,
              color: const Color(0xFFE8FADF),
              onTap: () => onPetTypeSelected('Other'),
            ),
            const SizedBox(height: 100), // Space for bottom nav bar
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
