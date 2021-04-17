import 'package:weights/abstraction/interfaces/interfaces.dart';
import 'package:weights/components/charts/charts.dart';
import 'package:weights/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class WeightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<IWeightData> weightsData =
        Provider.of<WeightsDataProvider>(context).weightsData;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          // horizontal: 20,
        ),
        child: Center(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1.7,
                  child: WeightsOverTimeChart(),
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
