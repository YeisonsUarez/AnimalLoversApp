

import 'package:carouserl_inicio/screens/autentication/autentication.dart';
import 'package:carouserl_inicio/screens/autentication/login.dart';
import 'package:carouserl_inicio/screens/autentication/signup.dart';
import 'package:carouserl_inicio/screens/menu/menu.dart';
import 'package:carouserl_inicio/screens/menu/screen2.dart';
import 'package:carouserl_inicio/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Autentication.routeName: (context)=> Autentication(),
  LoginPage.routeName:(context)=> LoginPage(),
  SignupPage.routeName:(context)=> SignupPage(),
  Menu.routeName: (context)=> Menu(),
  Screen2.routeName:(context)=> Screen2()

};
