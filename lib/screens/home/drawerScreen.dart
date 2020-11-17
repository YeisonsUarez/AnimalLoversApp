import 'package:carouserl_inicio/components/items_menu_widget.dart';
import 'package:carouserl_inicio/models/user.dart';
import 'package:carouserl_inicio/screens/autentication/loginScreen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/assist/assistScreen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/forum/chat_screen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/help/helpScreen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/profile/perfilScrenn.dart';
import 'package:carouserl_inicio/screens/optionsMenu/sponsor/sponsorScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'configuration.dart';

class DrawerScreen extends StatefulWidget {
  final User user;
  const DrawerScreen({Key key, this.user}) : super(key: key);
  @override
  _DrawerScreenState createState() => _DrawerScreenState(user);
}

class _DrawerScreenState extends State<DrawerScreen> {
  final User user;
  _DrawerScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PerfilScreen.routeName);
            },
            child: Row(
              children: [
                ClipOval(
                    child: Image.network(
                  user.urlFoto,
                  fit: BoxFit.cover,
                  width: 50.0,
                  height: 50.0,
                )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.name.split(" ")[0]} ${user.name.split(" ")[1]}",
                      style: TextStyle(
                          color: primaryGreen, fontWeight: FontWeight.bold),
                    ),
                    Text('Cuenta activa',
                        style: TextStyle(
                            color: primaryGreen, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          Column(
            children: _pintarElementos(),
          ),
          Row(
            children: [
              
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: primaryGreen,
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                      color: primaryGreen, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _pintarElementos() {
    List<Widget> elementos = [];
    elementos.add(ItemMenu(
      icon: Icons.person,
      texto: "Perfil",
      routeName: PerfilScreen.routeName,
      user: user,
    ));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
        user: user,
        icon: Icons.message,
        texto: "Foro",
        routeName: ChatScreen.routeName));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
      user: user,
      icon: Icons.people,
      texto: "Ayudar",
      routeName: AssistScreen.routeName,
    ));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
      user: user,
      icon: Icons.live_help,
      texto: "Encontrar\nAyuda",
      routeName: HelpScreen.routeName,
    ));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
      user: user,
      icon: Icons.pets,
      texto: "Padrino",
      routeName: SponsorScreen.routeName,
    ));

    return elementos;
  }
}
