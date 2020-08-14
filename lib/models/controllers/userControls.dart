import 'package:carouserl_inicio/screens/autentication/login.dart';
import 'package:carouserl_inicio/screens/menu/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user.dart';
import 'dart:async';

class UserControls {
  User _user;
  BuildContext _context;

  UserControls({user, context}) {
    this._user = user;
    this._context = context;
  }

  Future loginUser() async {
    try {
      FirebaseUser userFirebase = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: this._user.email, password: this._user.pass))
          .user;
      Navigator.of(_context).pop();
      Navigator.pushReplacement(
          this._context,
          MaterialPageRoute(
              builder: (context) => Menu(
                    user: userFirebase,
                  )));
    } catch (e) {
      print("error en Login");
    }
  }

  Future registerUser() async {
    print(this._user);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: this._user.email, password: this._user.pass);
      Navigator.pushReplacement(
          _context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      print(e.toString());
    }
  }
}
