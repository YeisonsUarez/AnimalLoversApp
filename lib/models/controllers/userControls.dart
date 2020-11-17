import 'package:carouserl_inicio/screens/autentication/loginScreen.dart';
import 'package:carouserl_inicio/screens/home/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      final FirebaseUser userFire = await FirebaseAuth.instance.currentUser();

      final firestoreInstance = Firestore.instance;
      firestoreInstance
          .collection("users")
          .document(userFire.uid)
          .get()
          .then((value) {
        user = User.fromJson(value.data);
        print(user.gender);
        Navigator.pushReplacementNamed(_context, Menu.routeName,
            arguments: user);
      });
    } catch (e) {
      final snackBar = SnackBar(
          content: Text('Datos incorrectos, intenta de nuevo'),
          action: SnackBarAction(
            label: 'Ocultar',
            onPressed: () {
              // Some code to undo the change.
            },
          ));
      Scaffold.of(_context).showSnackBar(snackBar);
      print("error en Login");
    }
  }

  Future updateData() async {
    try {
      final firestoreInstance = Firestore.instance;
      final FirebaseUser userFire = await FirebaseAuth.instance.currentUser();
      firestoreInstance
          .collection('users')
          .document(userFire.uid)
          .updateData({"_isSponsor": true});
    } catch (e) {
      print(e.toString());
    }
  }

  Future registerUser() async {
    print(this._user);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: this._user.email, password: this._user.pass)
          .whenComplete(() => null);
      final FirebaseUser userFire = await FirebaseAuth.instance.currentUser();
      final firestoreInstance = Firestore.instance;
      _user.id = userFire.uid.trim();
      firestoreInstance
          .collection("users")
          .document(userFire.uid.trim())
          .setData(_user.toJson());
      userFire.sendEmailVerification();
      Navigator.pushNamed(_context, LoginPage.routeName);
    } catch (e) {
      print(e.toString());
      final snackBar = SnackBar(
          content: Text('Error, intenta de nuevo'),
          action: SnackBarAction(
            label: 'Ocultar',
            onPressed: () {
              // Some code to undo the change.
            },
          ));
      Scaffold.of(_context).showSnackBar(snackBar);
    }
  }

  Future<List<User>> getSponsor() async {
    try {
      List<User> users;
      final firestoreInstance = Firestore.instance;
      firestoreInstance.collection("users").getDocuments().then((value) {
        value.documents.forEach((element) {
          print(User.fromJson(element.data));
          if (User.fromJson(element.data).isSponsor) {
            users.add(User.fromJson(element.data)); 
          }
        });
        
      });
      return users;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
