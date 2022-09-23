import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator_widget.dart';

class Data {
  final String name;
  final double value;
  final Color color;

  Data(this.name, this.value, this.color);
}

class PieData {
  static List<Data> data = [
    Data("red", 50, Colors.red),
    Data("green", 40, Colors.green),
    Data("pink", 7.5, Colors.pink),
    Data("yellow", 2.5, Colors.yellow),
  ];
}

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
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
            height: 250,
            width: 250,
            child: PieChart(PieChartData(
              sections: getSections(),
              centerSpaceRadius: 50,
            )),
          ),
          IndicatorWidget(
            data: PieData.data,
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> getSections() => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((key, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.value,
      );
      return MapEntry(key, value);
    })
    .values
    .toList();
