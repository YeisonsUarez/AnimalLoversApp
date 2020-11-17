import 'dart:io';

import 'package:carouserl_inicio/animation/FadeAnimation.dart';
import 'package:carouserl_inicio/models/controllers/userControls.dart';
import 'package:carouserl_inicio/models/user.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../../settings/constants.dart';

User user = User();

class SignupPage extends StatefulWidget {
  static final String routeName = "/signup";

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File _image;

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController dob = TextEditingController();
  DateTime selectedDate = DateTime.now().toLocal();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<Null> _selectDate(context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: selectedDate);
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
        body: Builder(
          builder: (context) => SingleChildScrollView(
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
                              "Registrarse",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Crea una cuenta, es gratis",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                            ))
                      ],
                    ),
                    Form(
                      autovalidate: false,
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.2,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nombre y apellidos",
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
                                    controller: name,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.4,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Correo electronico",
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
                                    controller: email,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.6,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Número de contacto",
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
                                    controller: phone,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.phone),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.2,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Sexo",
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
                                    controller: gender,
                                    decoration: InputDecoration(
                                      hintText: "Masculino/Femenino",
                                      prefixIcon: Icon(Icons.star),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.8,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Dirección",
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
                                    controller: address,
                                    decoration: InputDecoration(
                                      hintText: "",
                                      prefixIcon: Icon(Icons.location_city),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.8,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Contraseña",
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
                                    controller: pass,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "más de 6 caracteres",
                                      prefixIcon: Icon(Icons.security),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                              1.10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Repite la contraseña",
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
                                    controller: confirmPass,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.security),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )),
                          FadeAnimation(
                            1.5,
                            makeInputDoB(
                                label: "Fecha de nacimiento", context: context),
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
                                  onPressed: () {
                                    _formKey.currentState.save();
                                    if (pass.text != confirmPass.text) {
                                      print("contraseña mala");
                                      final snackBar = SnackBar(
                                          content: Text(
                                              'Las contraseñas no coinciden, intenta de nuevo'),
                                          action: SnackBarAction(
                                            label: 'Ocultar',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ));
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      if (_image == null ||
                                          name.text == "" ||
                                          email.text == "" ||
                                          pass.text == "" ||
                                          phone.text == "" ||
                                          gender.text == "" ||
                                          selectedDate.toIso8601String() ==
                                              "" ||
                                          address.text == "") {
                                        final snackBar = SnackBar(
                                            content: Text(
                                                'Por favor llena todos los campos, intenta de nuevo'),
                                            action: SnackBarAction(
                                              label: 'Ocultar',
                                              onPressed: () {
                                                // Some code to undo the change.
                                              },
                                            ));
                                        Scaffold.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        uploadFile();

                                        user.name = name.text;
                                        user.email = email.text;
                                        user.pass = pass.text;
                                        user.phone = phone.text;
                                        user.gender = gender.text;
                                        user.address = address.text;
                                        user.dob = DateFormat.yMMMMEEEEd()
                                            .format(selectedDate);
                                        UserControls controls =
                                            new UserControls(
                                                user: user, context: context);
                                        controls.registerUser();
                                      }
                                    }
                                  },
                                  color: kPrimaryColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
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
        ));
  }

  Widget makeInputDoB({label, obscureText = false, @required context}) {
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
        InkWell(
          onTap: () => _selectDate(context),
          child: InputDecorator(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
            ),
            child: Text(
              DateFormat.yMMMMEEEEd().format(selectedDate),
              style: TextStyle(fontSize: 20.0, color: kPrimaryColor),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
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

  Future uploadFile() async {
    String fileName = DateTime.now().toString() + ".jpg";
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child("users/${email.text}/$fileName");
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    print("File Uploaded");
    taskSnapshot.ref.getDownloadURL().then((value) {
      setState(() {
        user.urlFoto = value;
      });
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
