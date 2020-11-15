import 'package:carouserl_inicio/components/items_menu_widget.dart';
import 'package:carouserl_inicio/screens/optionsMenu/assist/assistScreen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/forum/chat_screen.dart';
import 'package:carouserl_inicio/screens/optionsMenu/profile/perfilScrenn.dart';
import 'package:carouserl_inicio/screens/optionsMenu/sponsor/sponsorScreen.dart';
import 'package:flutter/material.dart';
import 'configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
                  "https://scontent.fbga1-4.fna.fbcdn.net/v/t1.0-9/107255257_3057926057624057_8699687802890458276_o.jpg?_nc_cat=107&ccb=2&_nc_sid=84a396&_nc_ohc=a8Lkldkdp44AX8xetcM&_nc_ht=scontent.fbga1-4.fna&oh=9b0c282e1b0b24ab5aec52cec10489b3&oe=5FC8CB63",
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
                      'Lisseth Andrea',
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
              GestureDetector(
                onTap: () {
                  print("Configuración");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: primaryGreen,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Configuración',
                      style: TextStyle(
                          color: primaryGreen, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
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
                onTap: () {
                  print("Cerrar sesión");
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
    ));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
        icon: Icons.message, texto: "Foro", routeName: ChatScreen.routeName));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
      icon: Icons.people,
      texto: "Ayudar",
      routeName: AssistScreen.routeName,
    ));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
      icon: Icons.live_help,
      texto: "Encontrar\nAyuda",
      routeName: "/Ayuda",
    ));
    elementos.add(SizedBox(
      height: 20.0,
    ));
    elementos.add(ItemMenu(
      icon: Icons.pets,
      texto: "Padrino",
      routeName: SponsorScreen.routeName,
    ));

    return elementos;
  }
}
