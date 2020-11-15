import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/screens/home/animalDetailScreen.dart';
import 'package:carouserl_inicio/screens/home/configuration.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';

class ItemAnimal extends StatelessWidget {
  // final String urlImage;
  final Animal animal;

  ItemAnimal({
    @required this.animal,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(animal.name);
        Navigator.pushNamed(context, AnimalDetail.routeName, arguments: animal);
      },
      child: Container(
        height: 240,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: shadowList,
                          border: Border.all(color: Colors.blueAccent)),
                      margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          animal.urlImage,
                          width: 170.0,
                          height: 170.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top: 70, bottom: 30),
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            boxShadow: shadowList,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nombre: ${animal.name}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                            Text("Sexo: ${animal.gender}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                            Text("Ciudad: ${animal.city}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
