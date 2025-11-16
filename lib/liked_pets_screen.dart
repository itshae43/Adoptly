import 'package:flutter/material.dart';
import 'pet_info_screen.dart';
import 'discover_screen.dart';
import 'profile_screen.dart';
import 'pet_selection_screen.dart';

class LikedPetsScreen extends StatefulWidget {
  const LikedPetsScreen({super.key});

  @override
  State<LikedPetsScreen> createState() => _LikedPetsScreenState();
}

class _LikedPetsScreenState extends State<LikedPetsScreen> {
  // Sample liked pets data - In production, this would come from a state management solution
  final List<LikedPet> likedPets = [
    LikedPet(
      name: 'Charlie',
      image: 'charlie.png',
      age: 2,
      breed: 'German Shepherd',
      distance: '1.2 km',
      weight: 20.4,
      likedDate: '2 days ago',
      about: 'Charlie is fully vaccinated, he is friendly to everyone he meet. Charlie is not only affectionate but also well-behaved, knowing various commands.',
    ),
    LikedPet(
      name: 'Bruno',
      image: 'brunno.png',
      age: 3,
      breed: 'Bulldog',
      distance: '2.5 km',
      weight: 45.2,
      likedDate: '5 days ago',
      about: 'Bruno is a loyal and calm companion. He loves to play and is great with kids. Fully trained and ready for a new home.',
    ),
    LikedPet(
      name: 'Luna',
      image: 'gracy.png',
      age: 2,
      breed: 'Persian Cat',
      distance: '0.9 km',
      weight: 8.5,
      likedDate: '1 week ago',
      about: 'Luna is a sweet and gentle Persian cat. She loves to cuddle and is perfect for a quiet home. Well-groomed and litter trained.',
    ),
    LikedPet(
      name: 'Ozzy',
      image: 'ozzy.png',
      age: 1,
      breed: 'Labrador',
      distance: '0.8 km',
      weight: 35.8,
      likedDate: '1 week ago',
      about: 'Ozzy is an energetic puppy who loves to run and play. He is friendly with other dogs and loves outdoor activities.',
    ),
  ];

  void _removeLikedPet(int index) {
    setState(() {
      likedPets.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Removed from liked pets'),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.pink,
          onPressed: () {
            // Add undo functionality
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC1E3),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Liked Pets',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Your favorite companions',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.favorite, color: Colors.red, size: 20),
                            const SizedBox(width: 6),
                            Text(
                              '${likedPets.length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.person, color: Colors.black87, size: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Filter chips
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildFilterChip('All', true),
                  _buildFilterChip('Dogs', false),
                  _buildFilterChip('Cats', false),
                  _buildFilterChip('Others', false),
                  _buildFilterChip('Nearby', false),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Liked pets list
            Expanded(
              child: likedPets.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 100,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No liked pets yet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Start exploring to find your perfect companion',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black38,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DiscoverScreen(petType: 'Dog'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'Explore Pets',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: likedPets.length,
                      itemBuilder: (context, index) {
                        final pet = likedPets[index];
                        return _buildLikedPetCard(pet, index);
                      },
                    ),
            ),

            // Bottom Navigation
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PetSelectionScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.home_outlined, color: Colors.white, size: 28),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DiscoverScreen(petType: 'Dog'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search, color: Colors.white, size: 28),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite, color: Colors.red, size: 28),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          // Add filter functionality
          setState(() {});
        },
        backgroundColor: Colors.white,
        selectedColor: Colors.black87,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildLikedPetCard(LikedPet pet, int index) {
    return Dismissible(
      key: Key(pet.name + pet.likedDate),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => _removeLikedPet(index),
      background: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PetInfoScreen(
                name: pet.name,
                image: pet.image,
                age: pet.age,
                breed: pet.breed,
                distance: pet.distance,
                weight: pet.weight,
                about: pet.about,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              // Pet Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/${pet.image}',
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 140,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.pets,
                        size: 50,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),

              // Pet Info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${pet.name}, ${pet.age}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red, size: 24),
                            onPressed: () => _removeLikedPet(index),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pet.breed,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text(
                            pet.distance,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 16, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text(
                            'Liked ${pet.likedDate}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikedPet {
  final String name;
  final String image;
  final int age;
  final String breed;
  final String distance;
  final double weight;
  final String likedDate;
  final String about;

  LikedPet({
    required this.name,
    required this.image,
    required this.age,
    required this.breed,
    required this.distance,
    required this.weight,
    required this.likedDate,
    required this.about,
  });
}
