import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String currentScreen; // 'home', 'discover', 'profile'
  final String? selectedPetType; // 'Dog', 'Cat', or 'Other'

  const CustomBottomNavBar({
    super.key,
    required this.currentScreen,
    this.selectedPetType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D), // Dark background
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Only take needed space
        children: [
          // Home Icon
          _buildNavIcon(
            context: context,
            icon: Icons.home_outlined,
            isActive: currentScreen == 'home',
            onTap: () {
              if (currentScreen != 'home') {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),

          const SizedBox(width: 20),

          // Middle Icon - Always shows white circle with paw icon
          _buildMiddleIcon(context),

          const SizedBox(width: 20),

          // Profile Icon
          _buildNavIcon(
            context: context,
            icon: Icons.person_outline,
            isActive: currentScreen == 'profile',
            onTap: () {
              if (currentScreen != 'profile') {
                Navigator.pushNamed(context, '/profile');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({
    required BuildContext context,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? const Color(0xFF2D2D2D) : Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildMiddleIcon(BuildContext context) {
    // Always show the white circle with paw icon in the center
    return GestureDetector(
      onTap: () {
        // Navigate to pet selection or discover screen
        if (currentScreen != 'discover') {
          Navigator.pushNamed(context, '/pet_selection');
        }
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(Icons.pets, color: _getPawColor(), size: 28)),
      ),
    );
  }

  Color _getPawColor() {
    // Change color based on selected pet type
    if (selectedPetType != null) {
      if (selectedPetType == 'Dog') {
        return const Color(0xFFE6E6FA); // Light purple for dog
      } else if (selectedPetType == 'Cat') {
        return const Color(0xFFFDEEF4); // Light pink for cat
      } else {
        return const Color(0xFFE0F7FA); // Light cyan for other
      }
    }
    // Default gray color when no pet type is selected
    return const Color(0xFF2D2D2D);
  }
}
