import 'dart:core';

import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/components/item_list_user_widget.dart';
import 'package:carouserl_inicio/models/controllers/userControls.dart';
import 'package:carouserl_inicio/models/user.dart';
import 'package:carouserl_inicio/screens/home/configuration.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/material.dart';

class ListUsersScreen extends StatefulWidget {
  static final String routeName = "/listUsers";
  @override
  _ListUsersScreenState createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Text(
              "Contacta al usuario que deseas apadrinar en la adopción y crecimiento de su mascota",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue[900], fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Container(
            height: 50 * SizeConfig.heightMultiplier,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _pintarItems(users),
            ),
          ),
          FadeAnimation(
              1.2,
              Container(
                height: getProportionateScreenHeight(150),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
              ))
        ],
      ),
    );
  }

  List<Widget> _pintarItems(List<User> users) {
  

    List<Widget> widgets = [];
    users.forEach((element) {
      widgets.add(ItemListUser(
        user: element,
      ));
    });
    return widgets;
  }
}
