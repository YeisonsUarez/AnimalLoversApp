import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/screens/optionsMenu/sponsor/listUsersScreen.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/material.dart';

class SponsorScreen extends StatelessWidget {
  static final routeName = "/sponsor";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          FadeAnimation(
              1,
              Text(
                "Ser padrino",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                    fontSize: 30.0),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 30.0),
          FadeAnimation(
              1,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Ser padrino en AnimalsLovers, significa ayudar a la crianza de los animales apadrinados. Si aceptas ayudar ser padrino de uno o muchos animales, da clic en continuar.",
                  style: TextStyle(color: Colors.blue[900], fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              )),
          SizedBox(height: 30.0),
          FadeAnimation(
              1.2,
              Image.asset(
                "assets/images/padrino.png",
                width: getProportionateScreenWidth(200.0),
                height: getProportionateScreenHeight(200.0),
              )),
          FadeAnimation(
              1.2,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      
                      Navigator.pushNamed(context, ListUsersScreen.routeName);
                    },
                    color: kPrimaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Continuar",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
