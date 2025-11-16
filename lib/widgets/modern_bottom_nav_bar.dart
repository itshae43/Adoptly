import 'package:flutter/material.dart';

class ModernBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ModernBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D), // Dark background matching the image
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavItem(
              icon: Icons.home_rounded,
              index: 0,
              isActive: currentIndex == 0,
            ),
            const SizedBox(width: 24),
            _buildNavItem(
              icon: Icons.pets_rounded,
              index: 1,
              isActive: currentIndex == 1,
              isCenter: true,
            ),
            const SizedBox(width: 24),
            _buildNavItem(
              icon: Icons.favorite_rounded,
              index: 2,
              isActive: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required bool isActive,
    bool isCenter = false,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.all(isCenter ? 16 : 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? const Color(0xFF2D2D2D) : Colors.white,
          size: isCenter ? 28 : 24,
        ),
      ),
    );
  }
}
