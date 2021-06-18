import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import './indicator.dart';

class PieChartSample extends StatefulWidget {
  @override
  _PieChartSampleState createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  int _touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 250,
            // Pie Chart is available in fl_chart package
            child: PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 50.0,
                sectionsSpace: 0.0,
                startDegreeOffset: 30,
                // actual curves and data come from this function result.
                sections: _buildPieChartCurves(),
                // This is to make chart interactive when someone touch
                pieTouchData: PieTouchData(
                  touchCallback: (pieTouchResponse) {
                    setState(() {
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Here we will show different type of graph on different scenario touch and non touch
  List<PieChartSectionData> _buildPieChartCurves() {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      // Increase the radius of section when touched.
      final double radius = isTouched ? 60 : 50;

      // Ideally this data come from API and then returned, or you can modify it any way as per the data arranged in your app :)
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color(0xffF3BBEC),
            value: 33.33,
            title: 'Raça1', // this cannot be left blank
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xff39439f),
            value: 33.33,
            title: 'Raça2', // this cannot be left blank
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xff0eaeb4),
            value: 33.33,
            title: 'Raça3', // this cannot be left blank
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}