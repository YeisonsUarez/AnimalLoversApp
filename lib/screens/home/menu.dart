import 'package:carouserl_inicio/models/user.dart';
import 'package:flutter/material.dart';

import 'drawerScreen.dart';
import 'homeScreen.dart';

class Menu extends StatelessWidget {
  
  const Menu({Key key}) : super(key: key);
  static final String routeName = "/menu";
  
  //final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    final User args = ModalRoute.of(context).settings.arguments;
    print(args.email);
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(user: args,), HomeScreen(user: args,)],
      ),
    );
  }
}
