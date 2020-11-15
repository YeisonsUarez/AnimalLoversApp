import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'configuration.dart';

class AnimalDetail extends StatefulWidget {
  static final String routeName = "/details";

  @override
  _AnimalDetailState createState() => _AnimalDetailState();
}

class _AnimalDetailState extends State<AnimalDetail> {
  @override
  Widget build(BuildContext context) {
    final Animal args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: kPrimaryColor,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          "volver",
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Hero(tag: 1, child: Image.network(args.urlImage)),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: 400,
                    height: 300,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Datos del animalito",
                            style: TextStyle(
                                color: kPrimaryColor, fontSize: 20.0)),
                        Text(
                          "${args.type} llamado ${args.name}(${args.gender}), de raza ${args.breed}, encontrad@ en ${args.city}, tiene una edad aproximada de ${args.age}, ${args.illnesses == "" ? "no tiene enfermedades" : "sufre de " + args.illnesses} y ${args.hasACard ? "tiene carnet de vacucación" : "no tiene carnet de vacunación"}.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 120,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onTap: () {
                        final RenderBox box = context.findRenderObject();
                        Share.share("Adopta a ${args.name}: ${args.type} llamado ${args.name}(${args.gender}), de raza ${args.breed}, encontrad@ en ${args.city}, tiene una edad aproximada de ${args.age}, ${args.illnesses == "" ? "no tiene enfermedades" : "sufre de " + args.illnesses} y ${args.hasACard ? "tiene carnet de vacucación" : "no tiene carnet de vacunación"}.",
                            subject: "${args.type} llamado ${args.name}(${args.gender}), de raza ${args.breed}, encontrad@ en ${args.city}, tiene una edad aproximada de ${args.age}, ${args.illnesses == "" ? "no tiene enfermedades" : "sufre de " + args.illnesses} y ${args.hasACard ? "tiene carnet de vacucación" : "no tiene carnet de vacunación"}.",
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size)
                              ;
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Adoptar',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Center(
                              child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20.0,
                          ))
                        ],
                      )),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
