import 'dart:ui';

import 'package:flutter/material.dart';


class Planet {

  final String image;
  final Color color;
  final String name;
  final String description;

  const Planet({
    required this.image,
    required this.color,
    required this.name,
    required this.description,
  });

}


class Planets {

  static const list = <Planet>[
    // Planet(
    //   image: 'assets/images/planets/jupiter_1024x1024.png',
    //   color: Colors.brown,
    //   name: 'Jupiter',
    //   description: 'The largest planet in the Solar System.',
    // ),
    Planet(
      image: 'assets/images/planets/earth_2048x2048.png',
      color: Colors.blue,
      name: 'Earth',
      description: 'The third planet from the Sun and the only planet known to support life.',
    ),
    Planet(
      image: 'assets/images/planets/mercury_1024x1024.png',
      color: Colors.grey,
      name: 'Mercury',
      description: 'The smallest planet in the Solar System and the closest to the Sun.',
    ),
    Planet(
      image: 'assets/images/planets/venus_1024x1024.png',
      color: Colors.orange,
      name: 'Venus',
      description: 'The second planet from the Sun and the hottest planet in the Solar System.',
    ),
    Planet(
      image: 'assets/images/planets/earth_2048x2048.png',
      color: Colors.blue,
      name: 'Earth',
      description: 'The third planet from the Sun and the only planet known to support life.',
    ),
    Planet(
      image: 'assets/images/planets/mercury_1024x1024.png',
      color: Colors.grey,
      name: 'Mercury',
      description: 'The smallest planet in the Solar System and the closest to the Sun.',
    ),
    Planet(
      image: 'assets/images/planets/venus_1024x1024.png',
      color: Colors.orange,
      name: 'Venus',
      description: 'The second planet from the Sun and the hottest planet in the Solar System.',
    ),
    Planet(
      image: 'assets/images/planets/earth_2048x2048.png',
      color: Colors.blue,
      name: 'Earth',
      description: 'The third planet from the Sun and the only planet known to support life.',
    ),
    Planet(
      image: 'assets/images/planets/mercury_1024x1024.png',
      color: Colors.grey,
      name: 'Mercury',
      description: 'The smallest planet in the Solar System and the closest to the Sun.',
    ),
    Planet(
      image: 'assets/images/planets/venus_1024x1024.png',
      color: Colors.orange,
      name: 'Venus',
      description: 'The second planet from the Sun and the hottest planet in the Solar System.',
    ),
  ];

}