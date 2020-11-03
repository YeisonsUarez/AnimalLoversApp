import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/models/controllers/userControls.dart';
import 'package:carouserl_inicio/models/user.dart';
import 'package:carouserl_inicio/screens/autentication/autentication.dart';
import 'package:carouserl_inicio/screens/autentication/login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../settings/constants.dart';

class SignupPage extends StatefulWidget {
  static final String routeName = "/signup";

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController dob = TextEditingController();
  DateTime selectedDate = DateTime.now().toLocal();
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
            Navigator.of(context).pushNamed(Autentication.routeName);
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
                      FadeAnimation(
                          1.2,
                          makeInput(
                              icon: Icon(Icons.person),
                              label: "Nombre",
                              controller: name)),
                      FadeAnimation(
                          1.4,
                          makeInput(
                              icon: Icon(Icons.email),
                              label: "Email",
                              controller: email)),
                      FadeAnimation(
                          1.6,
                          makeInput(
                              icon: Icon(Icons.phone),
                              label: "Numero de contacto",
                              controller: phone)),
                      FadeAnimation(
                          1.2,
                          makeInput(
                              icon: Icon(Icons.star),
                              label: "Sexo",
                              controller: gender)),
                      FadeAnimation(
                          1.8,
                          makeInput(
                              icon: Icon(Icons.security),
                              label: "Password",
                              obscureText: true,
                              controller: pass)),
                      FadeAnimation(
                          1.10,
                          makeInput(
                              icon: Icon(Icons.security),
                              label: "Confirm password",
                              obscureText: true,
                              controller: confirmPass)),
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

  Widget makeInput(
      {data, icon, label, obscureText = false, @required controller}) {
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
          controller: controller,
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
      if (pass.text != confirmPass.text) {
        print("contraseña mala");
      } else {
        User user = User(
            name: name.text,
            email: email.text,
            pass: pass.text,
            phone: phone.text,
            gender: gender.text);
        user.dob = DateFormat.yMMMMEEEEd().format(selectedDate);
        UserControls controls = new UserControls(user: user, context: context);
        await controls.registerUser();
        Navigator.pushNamed(context, LoginPage.routeName,
            arguments: {"User": user});
      }
    }
  }
}
