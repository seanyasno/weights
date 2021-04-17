import 'package:weights/abstraction/interfaces/interfaces.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightsOverTimeChart extends StatelessWidget {
  final List<Color> gradientColors = [
    // const Color(0xffaf2d2d),
    // const Color(0xffce6262),
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final List<IWeightData> weightsData;

  WeightsOverTimeChart({@required this.weightsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Weights Over Time',
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor
          ),
        ),
        SizedBox(height: 15),
        AspectRatio(
          aspectRatio: 2,
          child: LineChart(mainData(context)),
        ),
      ],
    );
  }

  LineChartData mainData(BuildContext context) {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'MAR';
              case 3:
                return 'JUN';
              case 5:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontSize: 15,
          ),
          getTitles: (value) {
            if (value.toInt() % 10 == 0) {
              return value.toInt().toString();
            }

            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 5,
      minY: 70,
      maxY: 90,
      lineBarsData: [
        LineChartBarData(
          spots: weightsData
              .asMap()
              .entries
              .map((entry) => FlSpot(entry.key.toDouble(), entry.value.weight))
              .toList(),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
