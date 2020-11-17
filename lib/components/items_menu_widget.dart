import 'package:carouserl_inicio/models/user.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String texto, routeName;
  final User user;

  ItemMenu({this.icon, this.texto, this.routeName, this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          print(routeName);
          Navigator.pushNamed(context, routeName, arguments: user);
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
