import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:projetoivandro/screens/bar_chart.dart';
import 'package:projetoivandro/screens/bar_chart_two.dart';
import 'package:projetoivandro/services/auth.dart';
import 'package:projetoivandro/screens/line_chart.dart';
import 'package:projetoivandro/screens/pie_chart.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:Text('Home'),
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Sair'),
            onPressed:() async {
              await _auth.signOut();

            },
          )
        ],

      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: BarChartOne(),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: BarChartTwo(),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child:  PieChartSample(),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child:  LineChartSample1(),
                ),

              ]
      )


      )



    );
  }
}
