import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartOneState();
}

class BarChartOneState extends State<BarChartOne> {

  final List<double> weeklyData = [5.0, 6.5, 5.0, 7.5, 9.0, 11.5, 6.5];
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xff81e5cd),
      ),
      margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Analise',
            style: TextStyle(
                color: const Color(0xff0f4a3c),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Deslocamento Semanal',
            style: TextStyle(
                color: const Color(0xff379982),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                mainBarData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBar(
      int x,
      double y, {
        bool isTouched = false,
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          width: 22,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,

          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildAllBars() {
    return List.generate(
      weeklyData.length,
          (index) => _buildBar(index, weeklyData[index],
          isTouched: index == touchedIndex),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: _buildBarTouchData(),
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _buildAllBars(),
    );
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      // Build X axis.
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 16,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'D';
            case 1:
              return 'S';
            case 2:
              return 'T';
            case 3:
              return 'Q';
            case 4:
              return 'Q';
            case 5:
              return 'S';
            case 6:
              return 'S';
            default:
              return '';
          }
        },
      ),
      // Build Y axis.
      leftTitles: SideTitles(
        showTitles: false,
        getTitles: (double value) {
          return value.toString();
        },
      ),
    );
  }

  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.blueGrey,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay;
          switch (group.x.toInt()) {
            case 0:
              weekDay = 'Domingo';
              break;
            case 1:
              weekDay = 'Segunda';
              break;
            case 2:
              weekDay = 'Terça';
              break;
            case 3:
              weekDay = 'Quarta';
              break;
            case 4:
              weekDay = 'Quinta';
              break;
            case 5:
              weekDay = 'Sexta';
              break;
            case 6:
              weekDay = 'Sabado';
              break;
          }
          return BarTooltipItem(
            weekDay + '\n' + (rod.y).toString(),
            TextStyle(color: Colors.yellow),
          );
        },
      ),
      touchCallback: (barTouchResponse) {
        setState(() {

        });
      },
    );
  }
}