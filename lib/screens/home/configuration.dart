import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';

Color primaryGreen = kPrimaryColor;
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Animal> animals = [
  Animal(
      id: "0",
      type: "Perr@",
      urlImage:
          "https://cadenaser00.epimg.net/ser/imagenes/2017/07/21/sociedad/1500634153_335112_1500635729_noticia_normal.jpg",
      name: "Pelusa",
      gender: "Macho",
      age: "2 meses",
      breed: "Criollo",
      illnesses: "",
      city: "Bucaramanga",
      hasACard: true),
  Animal(
      id: "1",
      type: "Gat@",
      urlImage:
          "https://www.efeverde.com/storage/2018/02/Felinos-gato-fotolarena-551x310.jpg",
      name: "Salem",
      gender: "Macho",
      age: "2 meses",
      breed: "Criollo",
      illnesses: "",
      city: "Bucaramanga",
      hasACard: true),
  Animal(
      type: "Perr@",
      id: "2",
      urlImage:
          "https://www.fundacion-affinity.org/sites/default/files/que-hacer-si-encuentras-a-un-perro-perdido-o-abandonado.jpg",
      name: "Pelusa2",
      gender: "Macho",
      age: "2 meses",
      breed: "Criollo",
      illnesses: "",
      city: "Bucaramanga",
      hasACard: true),
  Animal(
    type: "Gat@",
      id: "3",
      urlImage: "https://i.ytimg.com/vi/eofgDuuS63g/maxresdefault.jpg",
      name: "Pelusa3",
      gender: "Macho",
      age: "2 meses",
      breed: "Criollo",
      illnesses: "",
      city: "Bucaramanga",
      hasACard: true)
];
List<String> genderList = ["Macho", "Hembra"];

List<String> typesAnimals = [
  "Gat@","Perr@","Conej@","Lor@"
];

List<Map> categories = [
  {'name': 'Gatos', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Perros', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Conejos', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Loros', 'iconPath': 'assets/images/parrot.png'}
];
