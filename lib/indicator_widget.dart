import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data
          .map(
            (e) => Container(
              child: buildIndicator(
                name: e.name,
                color: e.color,
                isSquare: true,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildIndicator({
    required String name,
    required Color color,
    bool isSquare = false,
    double size = 16,
    Color textColor = Colors.black,
  }) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
