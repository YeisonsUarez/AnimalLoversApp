import 'package:carouserl_inicio/models/user.dart';

class Animal {
  String _id, _urlImage, _name, _gender, _breed, _age, _illnesses, _city;
  bool _hasACard;
  User _user;

  Animal(
      {String id,
      String urlImage,
      String name,
      String gender,
      String breed,
      String age,
      String illnesses,
      String city,
      bool hasACard,
      User user})
      : this._id = id,
        this._urlImage = urlImage,
        this._name = name,
        this._gender = gender,
        this._breed = breed,
        this._age = age,
        this._illnesses = illnesses,
        this._city = city,
        this._hasACard = hasACard,
        this._user = user;

  set urlImage(String urlImage) {
    this._urlImage = urlImage;
  }

  set id(String id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set gender(String gender) {
    this._gender = gender;
  }

  set breed(String breed) {
    this._breed = breed;
  }

  set age(String age) {
    this._age = age;
  }

  set illnesses(String illnesses) {
    this._illnesses = illnesses;
  }

  set city(String city) {
    this._city = city;
  }

  set hasACard(bool hasACard) {
    this._hasACard = hasACard;
  }

  set user(User user) {
    this._user = user;
  }

  //getter
  String get urlImage => this._urlImage;
  String get name => this._name;
  String get gender => this._gender;
  String get breed => this._breed;
  String get age => this._age;
  String get illnesses => this._illnesses;
  String get city => this._city;
  bool get hasACard => this._hasACard;
  String get id => this._id;
  User get user => this._user;
}
