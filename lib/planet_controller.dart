import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:space/mini_planet_slider.dart';
import 'package:space/planets.dart';

class PlanetController extends ChangeNotifier {


  Planet _planet = Planets.list[0];

  int _currentPage = 0;

  Planet get planet => _planet;


  set currentPage(int value) {
    _currentPage = value;
    currentPlanet = value;
  }

  set currentPlanet(int value) {
    _planet = Planets.list[value];
    notifyListeners();
  }

}

