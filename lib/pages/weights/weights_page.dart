import 'package:weights/abstraction/interfaces/interfaces.dart';
import 'package:weights/components/charts/charts.dart';
import 'package:weights/models/models.dart';
import 'package:weights/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class WeightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<IWeightData> weightsData =
        Provider.of<WeightsDataProvider>(context).weightsData;

    if (weightsData.length == 0) {
      Provider.of<WeightsDataProvider>(context)
          .addWeight(new WeightData(weight: 81.8, dateTime: null));
      Provider.of<WeightsDataProvider>(context)
          .addWeight(new WeightData(weight: 81.6, dateTime: null));
      Provider.of<WeightsDataProvider>(context)
          .addWeight(new WeightData(weight: 81.3, dateTime: null));
      Provider.of<WeightsDataProvider>(context)
          .addWeight(new WeightData(weight: 80.9, dateTime: null));
      Provider.of<WeightsDataProvider>(context)
          .addWeight(new WeightData(weight: 80.5, dateTime: null));
      Provider.of<WeightsDataProvider>(context)
          .addWeight(new WeightData(weight: 80.2, dateTime: null));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Center(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: WeightsOverTimeChart(
                    weightsData: weightsData,
                  ),
                ),
              ),
            ],
          ),
          // child: AspectRatio(
          //   aspectRatio: 1.7,
          //   child: WeightsOverTimeChart(),
          // ),
        ),
      ),
    );
  }
}
