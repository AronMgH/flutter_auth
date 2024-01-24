import 'dart:convert';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';
import 'models.dart';

class AuthService {
  final String baseUrl = AppConstants.baseUrl;
  String userAgent = "";
  LoginResponse? _loginResponse;
  String? _lastError;

  AuthService() {
    getUserAgent().then((value) => userAgent = value);
  }

  Future<String> getUserAgent() async {
    try {
      await FkUserAgent.init();
      var userAgent = FkUserAgent.userAgent!;
      return userAgent;
    } on PlatformException {
      return "";
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/authentication/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'User-Agent': userAgent,
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response body to get the LoginResponse data
        _loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
        _lastError = null;
        return true;
      } else {
        _lastError = response.body;
        return false;
      }
    } catch (e) {
      throw Exception('Login Error');
    }
  }

  LoginResponse? getLoginResponse() {
    return _loginResponse;
  }

  Future<bool> register(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/registration'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'User-Agent': userAgent,
        },
        body: jsonEncode(<String, String>{
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword
        }),
      );

      if (response.statusCode == 200) {
        // Registration successful
        _lastError = null;
        return true;
      } else {
        // Registration failed
        _lastError = response.body;
        return false;
      }
    } catch (e) {
      throw Exception('Registration Error');
    }
  }

  String? getLastError() {
    return _lastError;
  }

  Future<bool> changePassword(String accessToken, String oldPassword,
      String newPassword, String confirmPassword) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/authentication/change-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'User-Agent': userAgent,
          'Authorization': "Bearer $accessToken"
        },
        body: jsonEncode(<String, String>{
          'oldPassword': oldPassword,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword
        }),
      );

      if (response.statusCode == 200) {
        // Password change successful
        _lastError = null;
        return true;
      } else {
        // Password change failed
        _lastError = response.body;
        return false;
      }
    } catch (e) {
      throw Exception('Change Password Error');
    }
  }

  Future<bool> logout(String accessToken) async {
    try {
      await http.put(
        Uri.parse('$baseUrl/authentication/change-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'User-Agent': userAgent,
          'Authorization': "Bearer $accessToken"
        },
      );
    } catch (e) {
      throw Exception('Change Password Error');
    }
    return true;
  }
}
