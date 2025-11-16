import 'package:flutter/material.dart';

class BlobNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BlobNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(double.infinity, 80),
            painter: BlobPainterStep1(currentIndex: currentIndex),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavIcon(Icons.home_outlined, 0),
              _buildNavIcon(Icons.search, 1),
              _buildNavIcon(Icons.favorite_outline, 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    final isSelected = currentIndex == index;
    
    if (isSelected) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      );
    }
    
    return IconButton(
      onPressed: () => onTap(index),
      icon: Icon(icon, color: Colors.white, size: 28),
    );
  }
}

class BlobPainterStep1 extends CustomPainter {
  final int currentIndex;

  BlobPainterStep1({required this.currentIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87..style = PaintingStyle.fill;

    // Create rounded rectangle for the nav bar
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(30),
    );

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
