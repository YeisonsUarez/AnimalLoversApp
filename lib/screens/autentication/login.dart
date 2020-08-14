import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/screens/menu/menu.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(1, Text("Iniciar sesión", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.2, Text("Inicia sesión con tu cuenta", style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700]
                        ),)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(1.2, makeInput(icon: Icon(Icons.email),label: "Email")),
                          FadeAnimation(1.3, makeInput(icon: Icon(Icons.security),label: "Password", obscureText: true)),
                        ],
                      ),
                    ),
                    FadeAnimation(1.4, Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                          },
                          color: kPrimaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text("Login", style: TextStyle(
                            fontWeight: FontWeight.w600, 
                            fontSize: 18
                          ),),
                        ),
                      ),
                    )),
                    FadeAnimation(1.5, Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        Text("Sign up", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18
                        ),),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            FadeAnimation(1.2, Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover
                )
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget makeInput({icon, label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: kPrimaryColor
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icon,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}