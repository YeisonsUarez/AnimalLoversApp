import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/screens/menu/configuration.dart';
import 'package:flutter/material.dart';

class ItemAnimal extends StatelessWidget {
  // final String urlImage;
  Animal animal;


  ItemAnimal({
    @ required this.animal,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            
          },
          child: Container(
        height: 240,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadowList,
                    ),
                    margin: EdgeInsets.only(top: 50),
                  ),
                  Align(
                    child: Hero(
                        tag: 1, child: Image.network(animal.urlImage)),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 60, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowList,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ))
          ],
        ),
      ),
    );
  }
}
