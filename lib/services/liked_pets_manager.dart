import 'package:flutter/material.dart';
import '../models/liked_pet.dart';

class LikedPetsManager extends ChangeNotifier {
  LikedPetsManager._();
  static final LikedPetsManager _instance = LikedPetsManager._();
  factory LikedPetsManager() => _instance;

  final List<LikedPet> _items = [];

  List<LikedPet> get items => List.unmodifiable(_items);

  void add(LikedPet pet) {
    final exists = _items.any((e) => e.name == pet.name);
    if (!exists) {
      _items.add(pet);
      notifyListeners();
    }
  }

  void remove(LikedPet pet) {
    _items.removeWhere((e) => e.name == pet.name);
    notifyListeners();
  }

  bool isLiked(String name) => _items.any((e) => e.name == name);
}
