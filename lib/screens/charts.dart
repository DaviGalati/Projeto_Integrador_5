import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('COWTECH'), backgroundColor: Colors.black,

        ),
        body:

        Padding(

            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  width:200,
                  height:200,
                  child: Image.asset('assets/imagens/Logo.jpg'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                Container(
                    child: FlatButton(
                      onPressed: (){
                        print(nameController.text);
                        print(passwordController.text);
                        print(emailController.text);
                      },
                      textColor: Colors.black,
                      child: Text('Esqueceu sua senha?'),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        print(emailController.text);
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Não possui uma conta?'),
                        FlatButton(
                          textColor: Colors.black,
                          child: Text(
                            'Criar',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )
        )
    );
  }
}