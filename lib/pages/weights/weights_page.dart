import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightsPage extends StatefulWidget {
  @override
  _WeightsPageState createState() => _WeightsPageState();
}

class _WeightsPageState extends State<WeightsPage> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1.7,
            child: LineChart(mainData()),
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
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
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            print(value);
            if (value.toInt() % 10 == 0) {
              return value.toInt().toString();
            }

            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 5,
      minY: 70,
      maxY: 90,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 81.8),
            FlSpot(1, 81.6),
            FlSpot(2, 81.3),
            FlSpot(3, 80.9),
            FlSpot(4, 80.5),
            FlSpot(5, 80.2),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
