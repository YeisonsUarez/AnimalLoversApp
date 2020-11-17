import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/models/user.dart';
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
      hasACard: true,
      user: users[0]),
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
      hasACard: true,
      user: users[0]),
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
      hasACard: true,
      user: users[0]),
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
      hasACard: true,
      user: users[0])
];
List<User> usersHelp = [
  User(
    name: "Sergio Lipez",
    address: "Cra. 22 ##32 - 25, Bucaramanga, Santander",
    urlFoto:
        "https://scontent.fbga1-4.fna.fbcdn.net/v/t1.0-9/76605247_3179758185430332_4947708325337759744_o.jpg?_nc_cat=100&ccb=2&_nc_sid=09cbfe&_nc_ohc=LuvTWDvLbBMAX9XDPv9&_nc_ht=scontent.fbga1-4.fna&oh=07ded3868894db275350ec63a9bf389b&oe=5FDA7EC4",
    phone: "3115540543",
  ),
  User(
    name: "Sergio Laguado",
    address: "Cra. 22 ##32 - 25, Bucaramanga, Santander",
    urlFoto:
        "https://scontent.fbga1-4.fna.fbcdn.net/v/t31.0-8/23826117_702081359998031_1122467118244280733_o.jpg?_nc_cat=104&ccb=2&_nc_sid=09cbfe&_nc_ohc=sMr9hEMKpd8AX9AUJT2&_nc_ht=scontent.fbga1-4.fna&oh=a301a3a6bea30e2856719097dfca92ca&oe=5FD9C3DC",
    phone: "3115540532",
  ),
  User(
    name: "Cristian Parra",
    address: "Cra. 22 ##32 - 25, Bucaramanga, Santander",
    urlFoto:
        "https://scontent.fbga1-4.fna.fbcdn.net/v/t31.0-8/10942302_10202526596085900_6918727339488244074_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=PSI71_VWFgUAX9WXE8o&_nc_ht=scontent.fbga1-4.fna&oh=1dd84e6d4933414500b6fa394b3c3d05&oe=5FD94E91",
    phone: "3115540543",
  ),
];

List<User> users = [
  User(
      name: "Yeison",
      address: "Cra. 22 ##32 - 25, Bucaramanga, Santander",
      urlFoto: "https://img.ecartelera.com/noticias/fotos/58000/58042/1.jpg",
      phone: "3115540543",
      email: "yeisonbleach@gmail.com"),
  User(
    name: "Lisseth",
    address: "Cra. 22 ##32 - 25, Bucaramanga, Santander",
    urlFoto:
        "https://scontent.fbga1-4.fna.fbcdn.net/v/t1.0-9/83188339_2667782503305083_6986704973501300736_n.jpg?_nc_cat=111&ccb=2&_nc_sid=8bfeb9&_nc_ohc=DaTl4SAsKN8AX8IyJDA&_nc_ht=scontent.fbga1-4.fna&oh=2d3860ca7617c593d242f77f294ed6b0&oe=5FD9A7AF",
    phone: "3115540532",
     email: "yeisonbleach@gmail.com"
  ),
  User(
    name: "Juan",
    address: "Cra. 22 ##32 - 25, Bucaramanga, Santander",
    urlFoto:
        "https://scontent.fbga1-4.fna.fbcdn.net/v/t1.0-9/103536315_2595819487358436_924102092898308500_o.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=RYwcwzsV2aYAX-raq-c&_nc_ht=scontent.fbga1-4.fna&oh=5a01e1d54c78f3fd3ecd3ad7f85427e1&oe=5FD84D79",
    phone: "3115540543",
     email: "yeisonbleach@gmail.com"
  ),
];
List<String> genderList = ["Macho", "Hembra"];

List<String> typesAnimals = ["Gat@", "Perr@", "Conej@", "Lor@"];

List<Map> categories = [
  {'name': 'Gatos', 'iconPath': 'assets/images/cat.png'},
  {'name': 'Perros', 'iconPath': 'assets/images/dog.png'},
  {'name': 'Conejos', 'iconPath': 'assets/images/rabbit.png'},
  {'name': 'Loros', 'iconPath': 'assets/images/parrot.png'}
];
