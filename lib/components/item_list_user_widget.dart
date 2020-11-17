import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/models/user.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/material.dart';

class ItemListUser extends StatelessWidget {
  final User user;
  ItemListUser({this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Container(
        height: 27 * SizeConfig.heightMultiplier,
        width: 60 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey, width: 0.2)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeAnimation(
                    0.9,
                    Image.network(
                      user.urlFoto,
                      width: 170.0,
                      height: 170.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Text("Datos del usuario", textAlign: TextAlign.center,),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, top: 2 * SizeConfig.heightMultiplier),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeAnimation(
                      1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          Expanded(
                            child: Text(
                              user.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 1.5 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                        1.2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_city),
                            Expanded(
                              child: Text(
                                user.address,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 1.5 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                    FadeAnimation(
                        1.4,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone),
                            Expanded(
                              child: Text(
                                user.phone,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 1.5 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
