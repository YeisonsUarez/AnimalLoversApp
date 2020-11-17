import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/components/item_animal_widget.dart';
import 'package:carouserl_inicio/components/item_publications_widget.dart';
import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/models/user.dart';
import 'package:carouserl_inicio/screens/home/configuration.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  static final String routeName = "/perfil";

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    /*final User user = User(
        name: "Lisseth Andrea Hernández Flórez",
        email: "lhernandez428@unab.edu.co",
        phone: "312241555",
        dob: "12 de Octubre de 2000",
        address: "Carrera 19 # 8 45, Bucaramanga",
        urlFoto:
            "https://scontent.fbga1-4.fna.fbcdn.net/v/t1.0-9/107255257_3057926057624057_8699687802890458276_o.jpg?_nc_cat=107&ccb=2&_nc_sid=84a396&_nc_ohc=a8Lkldkdp44AX8xetcM&_nc_ht=scontent.fbga1-4.fna&oh=9b0c282e1b0b24ab5aec52cec10489b3&oe=5FC8CB63");
*/
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                brightness: Brightness.light,
                backgroundColor: kPrimaryColor,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Color(0xffF8F8FA),
              body: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    color: kPrimaryColor,
                    height: 40 * SizeConfig.heightMultiplier,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                          top: SizeConfig.heightMultiplier),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 11 * SizeConfig.heightMultiplier,
                            width: 24 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: FadeAnimation(
                              0.9,
                              ClipOval(
                                  child: Image.network(
                                user.urlFoto,
                                fit: BoxFit.cover,
                                width: 50.0,
                                height: 50.0,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 5 * SizeConfig.widthMultiplier,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FadeAnimation(
                                    0.9,
                                    Text(
                                      "${user.name.split(" ")[0]} ${user.name.split(" ")[1]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              3 * SizeConfig.textMultiplier,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier,
                                  ),
                                  FadeAnimation(
                                    1.2,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.mail_outline,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2 * SizeConfig.widthMultiplier,
                                        ),
                                        Text(
                                          user.email,
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize:
                                                1.5 * SizeConfig.textMultiplier,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier,
                                  ),
                                  FadeAnimation(
                                    1.2,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.phone_android,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2 * SizeConfig.widthMultiplier,
                                        ),
                                        Text(
                                          user.phone,
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize:
                                                1.5 * SizeConfig.textMultiplier,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier,
                                  ),
                                  FadeAnimation(
                                    1.2,
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2 * SizeConfig.widthMultiplier,
                                        ),
                                        Text(
                                          user.dob,
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontSize:
                                                1.5 * SizeConfig.textMultiplier,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1 * SizeConfig.heightMultiplier,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              FadeAnimation(
                                1.3,
                                GestureDetector(
                                  onTap: () {
                                    print("Edit profile");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Editar perfil",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 1.8 *
                                                SizeConfig.textMultiplier),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3 * SizeConfig.heightMultiplier,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 35 * SizeConfig.heightMultiplier),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0,
                                  top: 3 * SizeConfig.heightMultiplier),
                              child: FadeAnimation(
                                1.4,
                                Text(
                                  "Mis publicaciones",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          2.2 * SizeConfig.textMultiplier),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3 * SizeConfig.heightMultiplier,
                            ),
                            Container(
                              height: 50 * SizeConfig.heightMultiplier,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: _pintarItems(animals),
                              ),
                            ),
                            SizedBox(
                              height: 3 * SizeConfig.heightMultiplier,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<Widget> _pintarItems(List<Animal> animales) {
    List<Widget> widgets = [];
    animales.forEach((element) {
      widgets.add(ItemPublications(
        animal: element,
        onTapDelete: () {
          setState(() {
            animals.remove(element);
          });
        },
        onTapEdit: () {
          print("edit");
        },
      ));
    });
    return widgets;
  }
}
