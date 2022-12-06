import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class CasesGraph extends StatelessWidget {
  const CasesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Center(
        child: SizedBox(
          height: 350,
          width: 400,
          child: LineChart(
            LineChartData(
              minX: 0,
              minY: 0,
              maxX: 5,
              maxY: 50,
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Colors.black, width: 2),
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      switch (value.toString()) {
                        case '0.0':
                          return const Text('July');
                        case '1.0':
                          return const Text('Aug');
                        case '2.0':
                          return const Text('Sept');
                        case '3.0':
                          return const Text('Oct');
                        case '4.0':
                          return const Text('Nov');
                        case '5.0':
                          return const Text('Dec');
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 42),
                    const FlSpot(1, 39),
                    const FlSpot(2, 21),
                    const FlSpot(3, 16),
                    const FlSpot(4, 9),
                    const FlSpot(5, 8),
                  ],
                  isCurved: true,
                  barWidth: 5,
                  gradient: LinearGradient(colors: [
                    ibmGreen['100'] as Color,
                    ibmGreen['70'] as Color
                  ]),
                  belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // colors: gradientColors.map((e) => e.withOpacity(0.0)).toList(),
                        colors: [
                          ibmGreen['60'] as Color,
                          ibmGreen['10'] as Color,
                          // Colors.transparent
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
