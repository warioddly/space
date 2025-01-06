import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:space/planets.dart';

class PlanetController extends ChangeNotifier {

  Planet _planet = Planets.list[0];

  Planet get planet => _planet;

  set currentPage(int value) {
    currentPlanet = value;
  }

  set currentPlanet(int value) {
    _planet = Planets.list[value];
    notifyListeners();
  }

}

