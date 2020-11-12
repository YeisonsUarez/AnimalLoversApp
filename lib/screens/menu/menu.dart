import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'drawerScreen.dart';
import 'homeScreen.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);
  static final String routeName = "/menu";
  //final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomeScreen()],
      ),
    );
  }
}
