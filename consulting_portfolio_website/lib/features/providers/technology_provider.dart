import 'dart:collection';

import 'package:consulting_portfolio_website/features/models/technology.dart';
import 'package:flutter/material.dart';

class TechnologyProvider extends ChangeNotifier {
  Technology _tech = Technology(id: 0, name: "", createdAt: "", updatedAt: "");

  Technology get technologies => _tech;

  void setTechnologies(String technology) {
    _tech = Technology.fromJson(technology);
    notifyListeners();
  }

  void setTechFromModel(Technology tech) {
    _tech = tech;
    notifyListeners();
  }

  final List<Technology> _techs = [];

  UnmodifiableListView<Technology> get tech => UnmodifiableListView(_techs);

  void addTech(Technology tech) {
    for (final technology in _techs) {
      print(technology);
    }

    _techs.add(tech);
    notifyListeners();
  }
}
