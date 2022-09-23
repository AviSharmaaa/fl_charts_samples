import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator_widget.dart';

class DataBar {
  final String name;
  final double value;
  final int id;
  final Color color;

  DataBar(this.name, this.value, this.id, this.color);
}

class BarData {
  static List<DataBar> data = [
    DataBar("Red", 20, 1, Colors.red),
    DataBar("Yellow", 40, 2, Colors.yellow),
    DataBar("Pink", 30, 3, Colors.pink),
    DataBar("Purple", 100, 4, Colors.purple),
    DataBar("Blue", 20, 6, Colors.blue),
  ];
}

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300,
            height: 250,
            child: BarChart(
              BarChartData(
                titlesData: titlesData,
                minY: 0,
                gridData: FlGridData(
                  show: false,
                ),
                barGroups: BarData.data
                    .map(
                      (e) => BarChartGroupData(
                        x: e.id,
                        barRods: [
                          BarChartRodData(
                              toY: e.value,
                              width: 20,
                              color: e.color,
                              borderRadius: BorderRadius.zero),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          IndicatorWidget(
            data: BarData.data,
          ),
        ],
      ),
    );
  }
}

FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 30,
          getTitlesWidget: getLeftTitles,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

Widget getLeftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  String text = "${value.toInt().toString()}k";

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4.0,
    child: Text(text, style: style),
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text = BarData.data
      .firstWhere(
        (element) => element.id == value.toInt(),
      )
      .name;

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4.0,
    child: Text(text, style: style),
  );
}
