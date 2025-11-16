import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: ShapeLearningDemo()),
    ),
  ));
}

class ShapeLearningDemo extends StatelessWidget {
  const ShapeLearningDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 100), // canvas size
      painter: BlobPainter(),
    );
  }
}

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Main blob shape (black)
    final blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();

    final double y = size.height * 0.5;
    final double leftCircleX = size.width * 0.15;
    final double rightCircleX = size.width * 0.85;
    final double radius = size.height * 0.4;

    // START at left circle
    path.moveTo(leftCircleX - radius, y);

    // LEFT CIRCLE (top half)
    path.quadraticBezierTo(
      leftCircleX - radius, y - radius,
      leftCircleX, y - radius,
    );

    // TOP EDGE connecting to middle bulge
    path.quadraticBezierTo(
      size.width * 0.35, y - radius * 0.8,
      size.width * 0.5, y - radius * 1.2,  // middle bulge up
    );
    path.quadraticBezierTo(
      size.width * 0.65, y - radius * 0.8,
      rightCircleX, y - radius,
    );

    // RIGHT CIRCLE (top half)
    path.quadraticBezierTo(
      rightCircleX + radius, y - radius,
      rightCircleX + radius, y,
    );

    // RIGHT CIRCLE (bottom half)
    path.quadraticBezierTo(
      rightCircleX + radius, y + radius,
      rightCircleX, y + radius,
    );

    // BOTTOM EDGE back to left
    path.quadraticBezierTo(
      size.width * 0.65, y + radius * 0.8,
      size.width * 0.5, y + radius * 1.2,  // middle bulge down
    );
    path.quadraticBezierTo(
      size.width * 0.35, y + radius * 0.8,
      leftCircleX, y + radius,
    );

    // LEFT CIRCLE (bottom half)
    path.quadraticBezierTo(
      leftCircleX - radius, y + radius,
      leftCircleX - radius, y,
    );

    path.close();
    canvas.drawPath(path, blackPaint);

    // Orange circle on left
    final orangePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(leftCircleX, y), radius * 0.9, orangePaint);

    // White inner circle
    final whitePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(leftCircleX, y), radius * 0.4, whitePaint);

    // Draw icons (simplified as circles for demonstration)
    // Paw icon in center
    final iconPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.5, y), radius * 0.3, iconPaint);

    // Heart icon on right
    canvas.drawCircle(Offset(rightCircleX, y), radius * 0.4, iconPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}