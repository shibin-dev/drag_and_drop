import 'package:flutter/material.dart';

enum AnimalType { land, air }

class Animal {
  final Color name;
  final AnimalType type;

  Animal({
    required this.name,
    required this.type,
  });
}

final allAnimals = [
  Animal(type: AnimalType.land, name: Colors.red),
  Animal(
    type: AnimalType.air,
    name: Colors.yellow,
  ),
  Animal(
    type: AnimalType.air,
    name: Colors.pink,
  ),
  Animal(
    type: AnimalType.land,
    name: Colors.brown,
  ),
  Animal(
    type: AnimalType.air,
    name: Colors.orangeAccent,
  ),
  Animal(
    type: AnimalType.land,
    name: Colors.greenAccent,
  ),
];
