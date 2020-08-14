import 'package:carouserl_inicio/constants.dart';
import 'package:flutter/material.dart';

Color primaryGreen = kPrimaryColor;
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/images/horse.png'}
];

List<Map> drawerItems=[
  {
    'icon': Icon(Icons.pets,color: Colors.white,size: 30,),
    'title' : 'Adoption'
  },
  {
    'icon': Icon(Icons.email,color: Colors.white,size: 30,),
    'title' : 'Donation'
  },
  {
    'icon': Icon(Icons.add_circle,color: Colors.white,size: 30,),
    'title' : 'Add pet'
  },
  {
    'icon': Icon(
      Icons.favorite,
      color: Colors.white,
      size: 30,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
    'title' : 'Favorites'
  },
  {
    'icon': Icon(Icons.message,color: Colors.white,size: 30,),
    'title' : 'Messages'
  },
  {
    'icon': Icon(Icons.people,color: Colors.white,size: 30,),
    'title' : 'Profile'
  },
];