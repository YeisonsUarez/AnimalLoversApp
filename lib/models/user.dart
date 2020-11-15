import 'package:path/path.dart';

class User {
  String _name,
      _email,
      _phone,
      _pass,
      _address,
      _latitude,
      _longitude,
      _dob,
      _gender,
      _urlFoto;
  bool _isEmailvalidated, _isSponsor, _isAssitant;

  User(
      {String name,
      String email,
      String phone,
      String pass,
      String dob,
      String gender,
      String address,
      String urlFoto,
      bool isSponsor = false,
      bool isAssitant = false})
      : this._name = name,
        this._email = email,
        this._phone = phone,
        this._pass = pass,
        this._dob = dob,
        this._gender = gender,
        this._address = address,
        this._urlFoto = urlFoto,
        this._isSponsor = isSponsor,
        this._isAssitant = isAssitant;
  //setter
  set name(String name) {
    this._name = name;
  }

  set urlFoto(String url_foto) {
    this._urlFoto = url_foto;
  }

  set isSponsor(bool isSponsor) {
    this._isSponsor = isSponsor;
  }

  set email(String email) {
    this._email = email;
  }

  set phone(String phone) {
    this._phone = phone;
  }

  set pass(String pass) {
    this._pass = pass;
  }

  set address(String address) {
    this._address = address;
  }

  set latitude(String latitude) {
    this._latitude = latitude;
  }

  set logintude(String logintude) {
    this._longitude = logintude;
  }

  set dob(String dob) {
    this._dob = dob;
  }

  set gender(String gender) {
    this._gender = gender;
  }

  set isEmailvalidated(bool isEmailvalidated) {
    this._isEmailvalidated = isEmailvalidated;
  }

  set isAssitant(bool isAssitant) {
    this._isAssitant = isAssitant;
  }

  //getter
  bool get isEmailvalidated => this._isEmailvalidated;
  String get name => this._name;
  String get email => this._email;
  String get phone => this._phone;
  String get pass => this._pass;
  String get address => this._address;
  String get gender => this._gender;
  String get dob => this._dob;
  String get latitude => this._latitude;
  String get longitude => this._longitude;
  String get urlFoto => this._urlFoto;
  bool get isSponsor => this._isSponsor;
  bool get isAssistant => this._isAssitant;
}
