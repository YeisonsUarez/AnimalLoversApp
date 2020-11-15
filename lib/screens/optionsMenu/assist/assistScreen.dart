import 'dart:ffi';

import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/material.dart';

class AssistScreen extends StatefulWidget {
  static final String routeName = "/assist";
  @override
  _assistScreenState createState() => _assistScreenState();
}

class _assistScreenState extends State<AssistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Ayudar",
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          FadeAnimation(
              1.0,
              Text(
                "Selecciona la actividad \n que deseas realizar",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 50.0,
          ),
          Container(
            height: getProportionateScreenHeight(500.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                FadeAnimation(
                  1.2,
                  GestureDetector(
                    onTap: () {
                     _showDialogDonate(title: "Llevar a pasear", detail: "Te registraremos como persona activa.\n Pronto te contactarán al número telefónico que registraste.\n Si deseas más información, escríbenos:",asset: "assets/images/perrito.png");
                    },
                    child: Image.asset("assets/images/pasear.png"),
                  ),
                ),
                FadeAnimation(
                  1.4,
                  GestureDetector(
                    onTap: () {

                     _showDialogDonate(title: "Llevar a la veterinaria", detail: "Te registraremos como persona activa.\n Pronto te contactarán al número telefónico que registraste.\n Si deseas más información, escríbenos:",asset: "assets/images/catt.png");

                    },
                    child: Image.asset("assets/images/veterinaria.png"),
                  ),
                ),
                FadeAnimation(
                  1.6,
                  GestureDetector(
                    onTap: () {
                      _showDialogDonate(title: "Contáctanos", detail: "Para realizar\n donativos, llámanos o\n escríbenos por WhatsApp:",asset: "assets/images/perrito.png");
                    },
                    child: Image.asset("assets/images/tarjeta.png"),
                  ),
                ),
                FadeAnimation(
                  1.8,
                  GestureDetector(
                    onTap: () {
                      _showDialogDonate(title: "Contáctanos", detail: "Para realizar\n donativos, llámanos o\n escríbenos por WhatsApp:",asset: "assets/images/catt.png");
                    },
                    child: Image.asset("assets/images/comida.png"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showDialogDonate({String title, String detail, String asset}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue[900],
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  detail,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    Text("3177953054",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  asset,
                  width: getProportionateScreenWidth(100.0),
                  height: getProportionateScreenHeight(100.0),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        Text(
                          'cerrar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
