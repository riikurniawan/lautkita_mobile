import 'dart:convert';

class RegisterRequestModel {

  // {
  //   "jwt_token": "4|laravel_sanctum_PoN9Rd51N52fXzy51tyWWRLVSjxSpqSikxH0d8DI70b5ce20",
  //   "user": {
  //       "id": 21,
  //       "name": "Galih",
  //       "role": "admin"
  //   }
  // }

  final String email;
  final String password;
  final String name;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));
}