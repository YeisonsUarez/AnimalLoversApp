import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';

Color primaryGreen = kPrimaryColor;
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Animal> animals = [
  Animal(urlImage: "https://cadenaser00.epimg.net/ser/imagenes/2017/07/21/sociedad/1500634153_335112_1500635729_noticia_normal.jpg", name: "Pelusa", gender: "Macho", age: "2 meses", breed: "Criollo", illnesses:"", city: "Bucaramanga", hasACard: true),
  Animal(urlImage: "https://cadenaser00.epimg.net/ser/imagenes/2017/07/21/sociedad/1500634153_335112_1500635729_noticia_normal.jpg", name: "Pelusa", gender: "Macho", age: "2 meses", breed: "Criollo", illnesses:"", city: "Bucaramanga", hasACard: true),
  Animal(urlImage: "https://cadenaser00.epimg.net/ser/imagenes/2017/07/21/sociedad/1500634153_335112_1500635729_noticia_normal.jpg", name: "Pelusa", gender: "Macho", age: "2 meses", breed: "Criollo", illnesses:"", city: "Bucaramanga", hasACard: true),
  Animal(urlImage: "https://cadenaser00.epimg.net/ser/imagenes/2017/07/21/sociedad/1500634153_335112_1500635729_noticia_normal.jpg", name: "Pelusa", gender: "Macho", age: "2 meses", breed: "Criollo", illnesses:"", city: "Bucaramanga", hasACard: true)
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/images/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/images/horse.png'}
];

List<Map> drawerItems = [
  {
    'icon': Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    ),
    'title': 'Perfil'
  },
  {
    'icon': Icon(
      Icons.message,
      color: Colors.white,
      size: 30,
    ),
    'title': 'Foro'
  },
  {
    'icon': Icon(
      Icons.people,
      color: Colors.white,
      size: 30,
    ),
    'title': 'Ayudar'
  },
  {
    'icon': Icon(
      Icons.live_help,
      color: Colors.white,
      size: 30,
    ),
    'title': 'Ayuda'
  },
  {
    'icon': Icon(
      Icons.pets,
      color: Colors.white,
      size: 30,
    ),
    'title': 'Padrino'
  },
];
