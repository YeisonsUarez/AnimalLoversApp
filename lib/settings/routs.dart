

import 'package:carouserl_inicio/screens/autentication/autenticationScreen.dart';
import 'package:carouserl_inicio/screens/autentication/loginScreen.dart';
import 'package:carouserl_inicio/screens/autentication/signupScreen.dart';
import 'package:carouserl_inicio/screens/home/addAnimalScreen.dart';
import 'package:carouserl_inicio/screens/home/animalDetailScreen.dart';
import 'package:carouserl_inicio/screens/home/menu.dart';
import 'package:carouserl_inicio/screens/optionsMenu/assist/assistScreen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/forum/chat_screen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/profile/perfilScrenn.dart';
import 'package:carouserl_inicio/screens/optionsMenu/sponsor/sponsorScreen.dart';
import 'package:carouserl_inicio/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';




// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Autentication.routeName: (context)=> Autentication(),
  LoginPage.routeName:(context)=> LoginPage(),
  SignupPage.routeName:(context)=> SignupPage(),
  Menu.routeName: (context)=> Menu(),
  AnimalDetail.routeName:(context)=> AnimalDetail(),
  AddAnimal.routeName:(context)=>AddAnimal(),
  PerfilScreen.routeName:(context)=> PerfilScreen(),
  ChatScreen.routeName:(context)=>ChatScreen(),
  AssistScreen.routeName:(context)=> AssistScreen(),
  SponsorScreen.routeName:(context)=>  SponsorScreen()

};
