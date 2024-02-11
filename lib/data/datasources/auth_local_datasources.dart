import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_response_model.dart';

class AuthLocalDatasource {
  Future<bool> saveAuthData(AuthResponseModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await pref.setString('auth', model.toJson());
    return result;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await pref.remove('auth');
    return result;
  }

  Future<String?> getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authModel = AuthResponseModel.fromJson(authJson);
    return authModel.user.name;
  }

  Future<String?> getUserRole() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authModel = AuthResponseModel.fromJson(authJson);
    return authModel.user.role.toLowerCase();
  }

  // Future<String?> getUserEmail() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   final authJson = pref.getString('auth') ?? '';
  //   final authModel = AuthResponseModel.fromJson(authJson);
  //   return authModel.;
  // }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authModel = AuthResponseModel.fromJson(authJson);
    return authModel.jwtToken;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}
