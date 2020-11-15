import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/screens/autentication/autenticationScreen.dart';
import 'package:flutter/material.dart';

// This is the best practice
import '../../../settings/constants.dart';
import '../../../settings/size_config.dart';
import '../components/splash_content.dart';
import '../../../components/default_button_widget.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          " Bienvenido a AnimalsLovers \n Ayudanos a salvar a los animales del mundo.",
      "image": "assets/images/splash_1.gif"
    },
    {
      "text": " Te ayudaremos a encontrar\n tu mascota ideal",
      "image": "assets/images/splash_3.png"
    },
    {
      "text": " Encuentra a tu nuevo compañero de vida \n ¡Adopta ya!",
      "image": "assets/images/splash_3.gif"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: FadeAnimation(1,PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    FadeAnimation(0.9,DefaultButton(
                      text: "Continuar",
                      press: () {
                        Navigator.of(context).pushReplacementNamed(Autentication.routeName);
                        
                      },
                    )),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
