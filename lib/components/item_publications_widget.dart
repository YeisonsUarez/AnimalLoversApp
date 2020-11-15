import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/screens/home/configuration.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/material.dart';

class ItemPublications extends StatefulWidget {
  final Animal animal;
  final Function onTapDelete, onTapEdit;

  ItemPublications(
      {@required this.animal,
      @required this.onTapDelete,
      @required this.onTapEdit});

  @override
  _ItemPublicationsState createState() =>
      _ItemPublicationsState(this.animal, this.onTapDelete, this.onTapEdit);
}

class _ItemPublicationsState extends State<ItemPublications> {
  final Animal animal;
  final Function onTapDelete, onTapEdit;

  _ItemPublicationsState(this.animal, this.onTapDelete, this.onTapEdit);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.animal.name);
        _showMyDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Container(
          height: 37 * SizeConfig.heightMultiplier,
          width: 60 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey, width: 0.2)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeAnimation(
                      0.9,
                      Image.network(
                        widget.animal.urlImage,
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
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 2 * SizeConfig.heightMultiplier),
                  child: FadeAnimation(
                    1,
                    Text(
                      "${widget.animal.type} llamado ${widget.animal.name}(${widget.animal.gender}), de raza ${widget.animal.breed}, encontrad@ en ${widget.animal.city}, tiene una edad aproximada de ${widget.animal.age}, ${widget.animal.illnesses == "" ? "no tiene enfermedades" : "sufre de " + widget.animal.illnesses} y ${widget.animal.hasACard ? "tiene carnet de vacucación" : "no tiene carnet de vacunación"}.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 1.5 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Opciones',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.arrow_right,
                  color: kPrimaryColor,
                ),
                Text(
                  '¿Qué deseas hacer?',
                  style: TextStyle(color: kPrimaryColor),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_left,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                      Text(
                        "volver",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    this.onTapDelete();
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Text(
                        'Eliminar',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    this.onTapEdit();
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      Text(
                        'Modificar',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
