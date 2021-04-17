import 'package:weights/abstraction/interfaces/interfaces.dart';
import 'package:weights/components/charts/charts.dart';
import 'package:weights/providers/providers.dart';
import 'package:weights/models/models.dart';
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
          horizontal: 10,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: enhanceChart(context, WeightsOverTimeChart(weightsData: weightsData)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget enhanceChart(BuildContext context, Widget chart) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16,
          right: 20,
        ),
        child: chart,
      ),
    );
  }
}
