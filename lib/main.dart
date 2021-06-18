import 'package:flutter/material.dart';
import 'package:projetoivandro/screens/wrapper.dart';
import 'package:projetoivandro/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:projetoivandro/models/user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),

        ),
    );
  }
}

