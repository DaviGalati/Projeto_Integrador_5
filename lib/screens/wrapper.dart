import 'package:flutter/material.dart';
import 'package:projetoivandro/screens/authenticate.dart';
import 'package:projetoivandro/screens/home.dart';
import 'package:projetoivandro/models/user.dart';
import 'package:provider/provider.dart';

  class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null ){
      return Authenticate();

      }else {
      return Home();

    }
  }
}
