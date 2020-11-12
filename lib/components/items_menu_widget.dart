import 'package:carouserl_inicio/screens/menu/configuration.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String texto,routeName;
  
  ItemMenu({this.icon, this.texto, this.routeName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print(routeName);
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(texto,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ],
        ),
      ),
    );
  }
}
