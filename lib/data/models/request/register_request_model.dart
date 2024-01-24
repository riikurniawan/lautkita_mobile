// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String role;
  
  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.name,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'role': role,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) => RegisterRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
