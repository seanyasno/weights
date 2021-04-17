import 'package:flutter/material.dart';
import 'package:weights/abstraction/interfaces/interfaces.dart';

class WeightData extends IWeightData {
  double weight;
  DateTime dateTime;

  WeightData({@required this.weight, @required this.dateTime});
}