import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'pet_info_screen.dart';
import 'profile_screen.dart';
import 'models/liked_pet.dart' as model;
import 'services/liked_pets_manager.dart';

class DiscoverScreen extends StatefulWidget {
  final String petType;
  
  const DiscoverScreen({super.key, required this.petType});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> with TickerProviderStateMixin {
  List<DogBreed> breeds = [];
  Set<int> selectedBreedIndices = {}; // Changed to Set for multiple selections
  List<PetCard> petCards = [];
  int currentCardIndex = 0;
  bool showLikeAnimation = false;

  @override
  void initState() {
    super.initState();
    _loadBreeds();
    _loadPetCards();
  }

  void _loadBreeds() {
    if (widget.petType == 'Dog') {
      breeds = [
        DogBreed(name: 'German Shepherd', image: 'german_shepherd.png'),
        DogBreed(name: 'Bulldog', image: 'bulldog.png'),
        DogBreed(name: 'Labrador Retriever', image: 'labrador.png'),
        DogBreed(name: 'Beagle', image: 'beagle.png'),
      ];
    } else if (widget.petType == 'Cat') {
      breeds = [
        DogBreed(name: 'Persian', image: 'Luna_parcianCat.png'),
        DogBreed(name: 'Siamese', image: 'Simba_SiamiseCat.png'),
        DogBreed(name: 'Maine Coon', image: 'Ozzy-Labrador.png'),
        DogBreed(name: 'British Shorthair', image: 'Max-jarmansefard.png'),
      ];
    } else {
      breeds = [
        DogBreed(name: 'Rabbit', image: 'beagle.png'),
        DogBreed(name: 'Hamster', image: 'german_shepherd.png'),
        DogBreed(name: 'Bird', image: 'bulldog.png'),
        DogBreed(name: 'Guinea Pig', image: 'labrador.png'),
      ];
    }
  }

  void _loadPetCards() {
    if (widget.petType == 'Dog') {
      petCards = [
        PetCard(
          name: 'Charlie', 
          image: 'jarmansefart-carly.png', 
          age: 2, 
          distance: '1.2 km', 
          breed: 'German Shepherd',
          weight: 20.4,
          about: 'Charlie is fully vaccinated, he is friendly to everyone he meet. Charlie is not only affectionate but also well-behaved, knowing various commands.',
        ),
        PetCard(
          name: 'Bruno', 
          image: 'burono-bulldog.png', 
          age: 3, 
          distance: '2.5 km', 
          breed: 'Bulldog',
          weight: 45.2,
          about: 'Bruno is a loyal and calm companion. He loves to play and is great with kids. Fully trained and ready for a new home.',
        ),
        PetCard(
          name: 'Ozzy', 
          image: 'Ozzy-Labrador.png', 
          age: 1, 
          distance: '0.8 km', 
          breed: 'Labrador',
          weight: 35.8,
          about: 'Ozzy is an energetic puppy who loves to run and play. He is friendly with other dogs and loves outdoor activities.',
        ),
        PetCard(
          name: 'Max', 
          image: 'Max-jarmansefard.png', 
          age: 4, 
          distance: '3.2 km', 
          breed: 'German Shepherd',
          weight: 55.0,
          about: 'Max is a mature and protective dog. He is well-trained and makes an excellent guard dog while being gentle with family.',
        ),
        PetCard(
          name: 'Rocky', 
          image: 'Rocky_GermanShepherd.png', 
          age: 3, 
          distance: '1.5 km', 
          breed: 'German Shepherd',
          weight: 48.5,
          about: 'Rocky is a strong and intelligent dog. He loves outdoor adventures and is great with children. Fully house-trained.',
        ),
        PetCard(
          name: 'Duke', 
          image: 'Duke_Bulldog.png', 
          age: 2, 
          distance: '2.0 km', 
          breed: 'Bulldog',
          weight: 42.0,
          about: 'Duke is a gentle giant with a sweet personality. He enjoys lazy afternoons and short walks. Perfect for apartment living.',
        ),
        PetCard(
          name: 'Cooper', 
          image: 'Cooper_Labrador.png', 
          age: 1, 
          distance: '1.8 km', 
          breed: 'Labrador',
          weight: 32.5,
          about: 'Cooper is playful and loves fetch games. He is very social and gets along well with other pets and people.',
        ),
        PetCard(
          name: 'Bailey', 
          image: 'Bailey_GoldenRetriever.png', 
          age: 4, 
          distance: '2.8 km', 
          breed: 'Golden Retriever',
          weight: 52.0,
          about: 'Bailey is a loving family dog who adores children. He is calm, obedient, and enjoys swimming and hiking.',
        ),
        PetCard(
          name: 'Zeus', 
          image: 'Zeus_Beagle.png', 
          age: 2, 
          distance: '1.1 km', 
          breed: 'Beagle',
          weight: 25.0,
          about: 'Zeus is curious and energetic. He has an excellent nose for tracking and loves exploring new places. Very friendly.',
        ),
      ];
    } else if (widget.petType == 'Cat') {
      petCards = [
        PetCard(
          name: 'Luna', 
          image: 'Luna_parcianCat.png', 
          age: 2, 
          distance: '0.9 km', 
          breed: 'Persian',
          weight: 8.5,
          about: 'Luna is a sweet and gentle Persian cat. She loves to cuddle and is perfect for a quiet home. Well-groomed and litter trained.',
        ),
        PetCard(
          name: 'Simba', 
          image: 'Simba_SiamiseCat.png', 
          age: 1, 
          distance: '1.5 km', 
          breed: 'Siamese',
          weight: 7.2,
          about: 'Simba is a playful and vocal Siamese cat. He loves attention and is very social. Great with children and other pets.',
        ),
        PetCard(
          name: 'Whiskers', 
          image: 'Whiskers_MaineCoon.png', 
          age: 3, 
          distance: '2.1 km', 
          breed: 'Maine Coon',
          weight: 12.5,
          about: 'Whiskers is a large and fluffy Maine Coon. He is gentle, friendly, and loves to explore. Very affectionate with family.',
        ),
        PetCard(
          name: 'Mittens', 
          image: 'Mittens_BritishShorthair.png', 
          age: 2, 
          distance: '1.8 km', 
          breed: 'British Shorthair',
          weight: 9.8,
          about: 'Mittens is a calm and independent British Shorthair. She enjoys quiet environments and is perfect for apartment living.',
        ),
        PetCard(
          name: 'Oliver', 
          image: 'Oliver_PersianCat.png', 
          age: 3, 
          distance: '1.2 km', 
          breed: 'Persian',
          weight: 9.0,
          about: 'Oliver is elegant and loves grooming sessions. He is quiet, affectionate, and prefers a peaceful home environment.',
        ),
        PetCard(
          name: 'Bella', 
          image: 'Bella_SiameseCat.png', 
          age: 1, 
          distance: '0.7 km', 
          breed: 'Siamese',
          weight: 6.8,
          about: 'Bella is energetic and talkative. She loves playing with toys and following her humans around. Very intelligent and curious.',
        ),
        PetCard(
          name: 'Shadow', 
          image: 'Shadow_MaineCoon.png', 
          age: 4, 
          distance: '2.5 km', 
          breed: 'Maine Coon',
          weight: 13.5,
          about: 'Shadow is majestic and gentle. He loves high perches and watching birds. Very patient and great with kids.',
        ),
        PetCard(
          name: 'Chloe', 
          image: 'Chloe_BritishShorthair.png', 
          age: 2, 
          distance: '1.4 km', 
          breed: 'British Shorthair',
          weight: 10.2,
          about: 'Chloe is sweet and laid-back. She enjoys napping in sunny spots and gentle petting. Perfect companion for quiet homes.',
        ),
        PetCard(
          name: 'Milo', 
          image: 'Milo_Ragdoll.png', 
          age: 1, 
          distance: '1.9 km', 
          breed: 'Ragdoll',
          weight: 8.8,
          about: 'Milo is a docile and affectionate Ragdoll. He goes limp when picked up and loves being held. Very gentle and calm.',
        ),
      ];
    } else {
      petCards = [
        PetCard(
          name: 'Fluffy', 
          image: 'jarmansefart-carly.png', 
          age: 1, 
          distance: '1.0 km', 
          breed: 'Rabbit',
          weight: 3.5,
          about: 'Fluffy is an adorable rabbit who loves to hop around. Very friendly and loves vegetables. Perfect for families with children.',
        ),
        PetCard(
          name: 'Nibbles', 
          image: 'burono-bulldog.png', 
          age: 1, 
          distance: '1.3 km', 
          breed: 'Hamster',
          weight: 0.3,
          about: 'Nibbles is a cute hamster who is active at night. Loves running on his wheel and is easy to care for.',
        ),
      ];
    }
  }

  void _onSwipe(bool isLike) {
    if (currentCardIndex < petCards.length) {
      // when liked, add to shared liked pets manager
      if (isLike) {
        final pc = petCards[currentCardIndex];
        final liked = model.LikedPet(
          name: pc.name,
          image: pc.image,
          age: pc.age,
          breed: pc.breed,
          distance: pc.distance,
          weight: pc.weight,
          likedDate: 'Now',
          petType: widget.petType,
          about: pc.about,
        );
        LikedPetsManager().add(liked);
      } else {
        // If user swiped left and that pet was previously liked, remove it
        final pc = petCards[currentCardIndex];
        final manager = LikedPetsManager();
        if (manager.isLiked(pc.name)) {
          manager.remove(model.LikedPet(
            name: pc.name,
            image: pc.image,
            age: pc.age,
            breed: pc.breed,
            distance: pc.distance,
            weight: pc.weight,
            likedDate: 'Before',
            petType: widget.petType,
            about: pc.about,
          ));
        }
      }

      setState(() {
        currentCardIndex++;
      });
    }
  }

  void _onDoubleTap() {
    setState(() {
      showLikeAnimation = true;
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        showLikeAnimation = false;
      });
      _onSwipe(true);
    });
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
                  Text(
                    'Discover',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person, color: Colors.black87, size: 24),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search ${widget.petType.toLowerCase()}',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Add search functionality here if needed
                          print('Searching for: $value');
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.tune, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Dog Breed Filter Chips
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: breeds.length,
                itemBuilder: (context, index) {
                  final breed = breeds[index];
                  final isSelected = selectedBreedIndices.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedBreedIndices.contains(index)) {
                          selectedBreedIndices.remove(index);
                        } else {
                          selectedBreedIndices.add(index);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: AssetImage('assets/images/${breed.image}'),
                            onBackgroundImageError: (exception, stackTrace) {
                              // Fallback to icon if image fails to load
                            },
                            child: null,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            breed.name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.pink : Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isSelected ? Icons.check : Icons.add,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

              // For You Section Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'For You - ${widget.petType}s',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const Icon(Icons.arrow_forward, size: 16, color: Colors.black87),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Swipeable Cards Stack
            Expanded(
              child: currentCardIndex >= petCards.length
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.pets, size: 80, color: Colors.black26),
                          const SizedBox(height: 16),
                          Text(
                            'No more pets to show',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentCardIndex = 0;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            ),
                            child: Text(
                              'Reload',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        // Show next 3 cards in stack
                        for (int i = math.min(currentCardIndex + 2, petCards.length - 1);
                            i >= currentCardIndex;
                            i--)
                          if (i < petCards.length)
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 16.0 + (i - currentCardIndex) * 8,
                                  right: 16.0 + (i - currentCardIndex) * 8,
                                  top: (i - currentCardIndex) * 8.0,
                                  bottom: 100.0,
                                ),
                                child: i == currentCardIndex
                                    ? SwipeableCard(
                                        pet: petCards[i],
                                        onSwipe: _onSwipe,
                                        onDoubleTap: _onDoubleTap,
                                        showLikeAnimation: showLikeAnimation,
                                      )
                                    : StaticCard(pet: petCards[i]),
                              ),
                            ),
                      ],
                    ),
            ),
            
            // Space for bottom navigation bar
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class SwipeableCard extends StatefulWidget {
  final PetCard pet;
  final Function(bool) onSwipe;
  final VoidCallback onDoubleTap;
  final bool showLikeAnimation;

  const SwipeableCard({
    super.key,
    required this.pet,
    required this.onSwipe,
    required this.onDoubleTap,
    required this.showLikeAnimation,
  });

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard> with SingleTickerProviderStateMixin {
  double _dragX = 0;
  double _dragY = 0;
  double _rotation = 0;
  bool _isDragging = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _isDragging = true;
      _dragX += details.delta.dx;
      _dragY += details.delta.dy;
      _rotation = _dragX / 1000;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragX.abs() > 100) {
      // Swipe threshold
      final isLike = _dragX > 0;
      _animateCardOff(isLike);
    } else {
      _resetCard();
    }
  }

  void _animateCardOff(bool isLike) {
    final targetX = isLike ? 500.0 : -500.0;
    _animationController.reset();
    final animation = Tween<double>(begin: _dragX, end: targetX).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    animation.addListener(() {
      setState(() {
        _dragX = animation.value;
        _rotation = _dragX / 1000;
      });
    });

    _animationController.forward().then((_) {
      widget.onSwipe(isLike);
      _resetCard();
    });
  }

  void _resetCard() {
    setState(() {
      _isDragging = false;
      _dragX = 0;
      _dragY = 0;
      _rotation = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      onDoubleTap: widget.onDoubleTap,
      child: Transform.translate(
        offset: Offset(_dragX, _dragY),
        child: Transform.rotate(
          angle: _rotation,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/${widget.pet.image}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.pets, size: 100, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Like/Nope overlay
              if (_isDragging && _dragX.abs() > 50)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: _dragX > 0
                          ? Colors.green.withOpacity(0.3)
                          : Colors.red.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: _dragX > 0 ? -0.3 : 0.3,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _dragX > 0 ? Colors.green : Colors.red,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _dragX > 0 ? 'LIKE' : 'NOPE',
                            style: TextStyle(
                              color: _dragX > 0 ? Colors.green : Colors.red,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              // Double tap like animation
              if (widget.showLikeAnimation)
                Positioned.fill(
                  child: Center(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 800),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Opacity(
                            opacity: 1.0 - value,
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 150,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              // Pet info overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetInfoScreen(
                                name: widget.pet.name,
                                image: widget.pet.image,
                                age: widget.pet.age,
                                breed: widget.pet.breed,
                                distance: widget.pet.distance,
                                weight: widget.pet.weight,
                                about: widget.pet.about,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          '${widget.pet.name}, ${widget.pet.age}',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white70, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            widget.pet.distance,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            widget.pet.breed,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
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

class StaticCard extends StatelessWidget {
  final PetCard pet;

  const StaticCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/images/${pet.image}',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.pets, size: 80, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DogBreed {
  final String name;
  final String image;

  DogBreed({required this.name, required this.image});
}

class PetCard {
  final String name;
  final String image;
  final int age;
  final String distance;
  final String breed;
  final double weight;
  final String about;

  PetCard({
    required this.name,
    required this.image,
    required this.age,
    required this.distance,
    required this.breed,
    required this.weight,
    required this.about,
  });
}
