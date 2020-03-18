import 'dart:ffi';

import 'package:lost_and_found/services/auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget{

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState()=> _SignInState();
}
class _SignInState extends State<SignIn>
{
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Text('Sign in to Lost and Found'),
        actions: <Widget>[
          FlatButton.icon(
           onPressed: (){
              widget.toggleView();
           },
           icon: Icon(Icons.person),
           label: Text('Register'),
           )
        ],
        ),
      body:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
             Image(image:  AssetImage("assets/1.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode:BlendMode.darken,
            ),
             Image(image:  AssetImage("assets/nitk1.jpeg",),

            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 FlutterLogo(
                  size:0
                ),
                Form(
                  child : Theme(
                    data: ThemeData(
                    brightness: Brightness.dark,primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color:Colors.teal,
                        )
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         TextFormField( 
                          onChanged: (val){
                            setState(() => email= val);

                          },
                          decoration: InputDecoration(
                            hintText: "Enter EmailId",
                          ),
                          keyboardType: TextInputType.text,
                        ),
                         TextFormField(
                           
                           onChanged: (val){
                             setState(() => password= val);

                                      },
                          decoration: InputDecoration(
                            hintText: "Enter password ",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        
                        //Though email id and password are taken here, for now anonymous method is tried to be
                        //taken here(Change this later)

                         //if there is an error later, try to change RaisedButton to MaterialButton and add height
                         RaisedButton(
                          color:Colors.teal,
                          textColor: Colors.white,
                          child:  Text("login"),
                            onPressed: () async {
                              print(email);
                              print(password);
                                /*dynamic result = await _auth.signInAnon();
                                if(result == null){
                                  print('error signing in');
                                } else {
                                  print('signed in');
                                  print(result.uid);
                                }*/
                          },
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ),
                  )

                )
              ],
            )]
      ),
    );

  }
}