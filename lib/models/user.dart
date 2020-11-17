import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart';

@JsonSerializable()
class User {
  String _id,
      _name,
      _email,
      _phone,
      _pass,
      _address,
      _latitude,
      _longitude,
      _dob,
      _gender,
      _urlFoto;
  bool _isSponsor, _isAssitant;

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
  Map<String, dynamic> toJson() => {
        '_id': _id,
        '_name': _name,
        '_email': _email,
        '_phone': _phone,
        '_pass': _pass,
        '_address': _address,
        '_latitude': _latitude,
        '_longitude': _longitude,
        '_dob': _dob,
        '_gender': _gender,
        '_urlFoto': _urlFoto,
        '_isSponsor': _isSponsor,
        '_isAssitant': _isAssitant
      };
  User.fromJson(Map<String, dynamic> json)
      : _id = json["_id"],
        _name = json["_name"],
        _email = json["_email"],
        _phone = json["_phone"],
        _address=json["_address"],
        _isAssitant=json["_isAssitant"],
        _isSponsor=json["_isSponsor"],
        _dob=json["_dob"],
        _urlFoto=json["_urlFoto"],
        _gender= json["_gender"]
        ;
        
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

  set isAssitant(bool isAssitant) {
    this._isAssitant = isAssitant;
  }

  set id(String id) => _id = id;

  //getter
  // bool get isEmailvalidated => this._isEmailvalidated;
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
  String get id => this._id;
}
