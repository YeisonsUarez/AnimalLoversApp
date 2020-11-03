class User {
  String _name,
      _email,
      _phone,
      _pass,
      _address,
      _latitude,
      _longitude,
      _dob,
      _gender;
  bool _isEmailvalidated, _isSponsor;

  User(
      {String name,
      String email,
      String phone,
      String pass,
      String dob,
      String gender,
      bool isSponsor=false})
      : this._name = name,
        this._email = email,
        this._phone = phone,
        this._pass = pass,
        this._dob = dob,
        this._gender = gender,
        this._isSponsor = isSponsor;
  //setter
  set name(String name) {
    this._name = name;
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
  bool get isSponsor => this._isSponsor;
}
