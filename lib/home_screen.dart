import 'package:flutter/material.dart';

class Pet {
  final String name;
  final String image;
  final String distance;
  final Color bgColor;
  final String type; // 'Dog', 'Cat', or 'Other'

  Pet({
    required this.name,
    required this.image,
    required this.distance,
    required this.bgColor,
    required this.type,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Sample data for pets with types
  static final List<Pet> allPets = [
    // Dogs
    Pet(name: 'Charlie', image: 'charlie.png', distance: '1.2 km away', bgColor: const Color(0xFFE6E6FA), type: 'Dog'),
    Pet(name: 'Brunno', image: 'brunno.png', distance: '1.2 km away', bgColor: const Color(0xFFFDEEF4), type: 'Dog'),
    Pet(name: 'Ozzy', image: 'ozzy.png', distance: '1.2 km away', bgColor: const Color(0xFFE8FADF), type: 'Dog'),
    
    // Cats
    Pet(name: 'Brook', image: 'brook_cat.png', distance: '1.2 km away', bgColor: const Color(0xFFFDEEF4), type: 'Cat'),
    Pet(name: 'Gracy', image: 'gracy.png', distance: '1.2 km away', bgColor: const Color(0xFFFFECE1), type: 'Cat'),
    
    // Others
    Pet(name: 'Brook', image: 'brook_rabbit.png', distance: '1.2 km away', bgColor: const Color(0xFFE0F7FA), type: 'Other'),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the pet type from navigation arguments
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String petType = args?['petType'] ?? 'Dog';

    // Filter pets based on selected type
    final filteredPets = allPets.where((pet) => pet.type == petType).toList();

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
        title: Column(
          children: [
            Text(
              "Hello, $petType Lover!",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 16),
                Text(
                  "California, USA",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.grey),
            onPressed: () {
              // Handle sort action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore ${petType}s",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredPets.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pets,
                            size: 80,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "No ${petType}s available yet",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: filteredPets.length,
                      itemBuilder: (context, index) {
                        final pet = filteredPets[index];
                        return PetCard(pet: pet);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/pet_detail',
          arguments: {
            'name': pet.name,
            'image': pet.image,
            'distance': pet.distance,
            'type': pet.type,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: pet.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -10,
              child: Image.asset(
                'assets/images/${pet.image}',
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.pets,
                      size: 60,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.favorite_border, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pet.distance,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}