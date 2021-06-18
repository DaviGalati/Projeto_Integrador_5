import 'package:flutter/material.dart';
import 'package:projetoivandro/services/auth.dart';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password ='';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title:Text('Cadastro'),
          actions: <Widget>[
            FlatButton.icon(
                icon:Icon(Icons.person),
                label: Text('Sign in'),
                onPressed: (){
                  widget.toggleView();
                },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
              child: Column (
                children: <Widget>[
                  SizedBox(height: 35.0),
                  TextFormField(
                    validator: (val)=> val.isEmpty ? 'Enter Email' : null,
                    onChanged: (val){
                      setState(()=>email=val);
                    },
                  ),

                  SizedBox(height: 35.0),
                  TextFormField(


                    obscureText:true,
                    validator: (val)=> val.length < 6 ? 'Senha tem que ter 6 caracteres' : null,

                    onChanged: (val){
                      setState(()=>password=val);

                    },
                  ),
                  SizedBox(height: 30.0),
                  RaisedButton(
                    color:Colors.black,
                    child:Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white)
                    ),
                    onPressed: () async{
                      if (_formKey.currentState.validate()){
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if (result == null){
                          setState(()=>error = 'Erro, email invalido.');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                      error,
                      style:TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],

              )
          ),
        )



    );
  }
}
