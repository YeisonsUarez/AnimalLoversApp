import 'dart:io';

import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/screens/home/menu.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'configuration.dart';

class AddAnimal extends StatefulWidget {
  static final String routeName = "/addAnimal";

  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {
  File _image;
  String selectedUser;
  String selectedType;
  bool isSelectedCheckBox = false;

  TextEditingController name = TextEditingController();

  TextEditingController breed = TextEditingController();

  TextEditingController age = TextEditingController();
  TextEditingController illnesses = TextEditingController();

  TextEditingController city = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Registrar un animalito",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Por favor llena todos los campos para dar una mejor información a las personas que deseen adoptar",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                        1.25,
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    _image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    Text(
                                      "Añade una foto de perfil dando clic sobre la imagen de cámara.",
                                      style: TextStyle(color: kPrimaryColor),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                        ))
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.2,
                          makeInput(
                              icon: Icon(Icons.person),
                              label: "Nombre",
                              controller: name)),
                      FadeAnimation(
                          1.4,
                          makeInput(
                              icon: Icon(Icons.pets),
                              label: "Raza",
                              controller: breed)),
                      FadeAnimation(
                          1.6,
                          makeInput(
                              icon: Icon(Icons.calendar_today),
                              label: "Edad aproximada",
                              controller: age)),
                      FadeAnimation(
                          1.2,
                          makeInput(
                              icon: Icon(Icons.star),
                              label:
                                  "Por favor indicanos que enfermedades tiene",
                              controller: illnesses)),
                      FadeAnimation(
                          1.8,
                          makeInput(
                              icon: Icon(Icons.location_city),
                              label: "Ciudad donde se encuentra",
                              controller: city)),
                      FadeAnimation(
                          1.10,
                          DropdownButton<String>(
                            hint: Text("Selecciona el sexo"),
                            value: selectedUser,
                            onChanged: (String value) {
                              setState(() {
                                selectedUser = value;
                              });
                            },
                            items: genderList.map((String item) {
                              return DropdownMenuItem<String>(
                                  value: item,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        item,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          )),
                      FadeAnimation(
                          1.11,
                          DropdownButton<String>(
                            hint: Text("Selecciona el tipo de animalito"),
                            value: selectedType,
                            onChanged: (String value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                            items: typesAnimals.map((String item) {
                              return DropdownMenuItem<String>(
                                  value: item,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        item,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          )),
                      FadeAnimation(
                        1.4,
                        CheckboxListTile(
                          secondary: const Icon(Icons.pets),
                          title: const Text('¿Tiene carnet de vacunas?'),
                          value: isSelectedCheckBox,
                          onChanged: (bool value) {
                            setState(() {
                              isSelectedCheckBox = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      FadeAnimation(
                          1.5,
                          Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: register,
                              color: kPrimaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Registrar animalito",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInput(
      {data, icon, label, obscureText = false, @required controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return "Por favor llena este campo";
            }

            return value;
          },
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: icon,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.pop(context);
    }
  }

  _imgFromCamera() async {
    //File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  _imgFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
