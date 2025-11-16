import 'package:flutter/material.dart';

class PetDetailScreen extends StatelessWidget {
  final String petName;
  final String petImage;
  final String petDistance;
  final String petType;

  const PetDetailScreen({
    super.key,
    required this.petName,
    required this.petImage,
    required this.petDistance,
    this.petType = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, $petName!"),
        backgroundColor: const Color(0xFFE91E63),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the pet image
            Image.asset(
              'assets/images/$petImage',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.pets,
                    size: 80,
                    color: Colors.grey,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              "You selected $petName!",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "They are $petDistance from you.",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            if (petType.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                "Type: $petType",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE91E63),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Go Back",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
