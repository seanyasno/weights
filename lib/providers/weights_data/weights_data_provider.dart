import 'package:weights/abstraction/interfaces/interfaces.dart';
import 'package:flutter/material.dart';

class WeightsDataProvider with ChangeNotifier {
  List<IWeightData> _weightsData;

  WeightsDataProvider() {
    _weightsData = [];
  }

  List<IWeightData> get weightsData => _weightsData;

  void addWeight(IWeightData weightData) {
    _weightsData.add(weightData);
  }

  void removeWeight(IWeightData weightData) {
    _weightsData.remove(weightData);
  }

  void editWeight(IWeightData oldWeightData, IWeightData newWeightData) {
    final int oldWeightDataIndex = _weightsData
        .indexWhere((weightData) => weightData.date == oldWeightData.date);
    _weightsData[oldWeightDataIndex].weight = newWeightData.weight;
  }
}
