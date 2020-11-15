import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

import '../../../settings/constants.dart';
import '../../../settings/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        FadeAnimation(1, Text(
            "AnimalsLovers",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: 
          Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        
          ),
        ),

        
      ],
    );
  }
}
