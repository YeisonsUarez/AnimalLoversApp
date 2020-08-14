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
  bool _isEmailvalidated;
  

  User(this._name, this._email, this._phone, this._pass, this._dob,
      this._gender, this._isEmailvalidated);
  //setter
  set name(String name) {
    this._name = name;
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
}
