import 'dart:convert';

import 'package:challenge/constant.dart';
import 'package:challenge/models/api_response.dart';
import 'package:challenge/models/user.dart';
import 'package:http/http.dart' as htpp;
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> login(String phone, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await htpp.post(Uri.parse(loginURL), headers: {
      'Accept': 'application/json'
    }, body: {
      // 'name': name,
      'phone': phone,
      'password': password,
      'confirm_password': password
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await htpp.post(Uri.parse(loginURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer$token'
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = uauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get userId
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}
