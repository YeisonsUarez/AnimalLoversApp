import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/models/controllers/userControls.dart';
import 'package:carouserl_inicio/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPageStateful(),
    );
  }
}

class SignupPageStateful extends StatefulWidget {
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPageStateful> {
  DateTime selectedDate = DateTime.now().toLocal();
  User user = new User("", "", "", "", "", "", false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: selectedDate);
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Registrarse",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Crea una cuenta, es gratis",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.2,
                          makeInput(icon: Icon(Icons.person), label: "Nombre")),
                      FadeAnimation(1.4,
                          makeInput(icon: Icon(Icons.email), label: "Email")),
                      FadeAnimation(
                          1.6,
                          makeInput(
                              icon: Icon(Icons.phone),
                              label: "Numero de contacto")),
                      FadeAnimation(1.2,
                          makeInput(icon: Icon(Icons.star), label: "Sexo")),
                      FadeAnimation(
                          1.8,
                          makeInput(
                              icon: Icon(Icons.security),
                              label: "Password",
                              obscureText: true)),
                      FadeAnimation(
                          1.10,
                          makeInput(
                              icon: Icon(Icons.security),
                              label: "Confirm password",
                              obscureText: true)),
                      FadeAnimation(
                        1.5,
                        makeInputDoB(label: "Fecha de nacimiento"),
                      ),
                      FadeAnimation(
                          1.5,
                          Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: register,
                              color: kPrimaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                FadeAnimation(
                    1.6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?"),
                        Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput({data, icon, label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return "Por favor llena este campo";
            }

            return value;
          },
          onSaved: (value) {
            switch (label) {
              case "Nombre":
                {
                  user.name = value;
                }
                break;
              case "Email":
                {
                  user.email = value;
                }
                break;
              case "Numero de contacto":
                {
                  user.phone = value;
                }
                break;
              case "Password":
                {
                  user.pass = value;
                }
                break;

              case "Sexo":
                {
                  user.gender = value;
                }
                break;
            }
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icon,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputDoB({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
            ),
            child: Text(
              DateFormat.yMMMMEEEEd().format(selectedDate),
              style: TextStyle(fontSize: 20.0, color: kPrimaryColor),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      user.dob = DateFormat.yMMMMEEEEd().format(selectedDate);
      UserControls controls = new UserControls(user: user, context: context);
      await controls.registerUser();
    }
  }
}
