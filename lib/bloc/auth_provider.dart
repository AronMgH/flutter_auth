import 'package:flt_challenge/api/models.dart';
import 'package:flutter/material.dart';
import '../api/auth_service.dart';
import 'auth_states.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  AuthenticationState authState = Unauthenticated();
  LoginResponse? loginResponse;
  bool loading = false;

  Future<void> login(String username, String password) async {
    try {
      loading = true;
      notifyListeners();
      final status = await _authService.login(username, password);
      if (status) {
        authState = LoginSuccess();
        loginResponse = _authService.getLoginResponse();
      } else {
        authState = LoginError();
      }
      loading = false;
      notifyListeners();
    } catch (error) {
      throw Exception('Login Error');
    }
  }

  Future<void> register(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    try {
      loading = true;
      notifyListeners();
      final status = await _authService.register(
          firstName, lastName, email, password, confirmPassword);
      authState = status ? RegistrationSuccess() : RegistrationError();
      loading = false;
      notifyListeners();
    } catch (error) {
      throw Exception('Registration Error');
    }
  }

  Future<void> changePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    try {
      loading = true;
      notifyListeners();
      final status = await _authService.changePassword(
          loginResponse!.accessToken,
          oldPassword,
          newPassword,
          confirmPassword);

      authState = status ? ChangePasswordSuccess() : ChangePasswordError();
      notifyListeners();
    } catch (error) {
      throw Exception('Change Password Error');
    }
  }

  Future<void> logout() async {
    try {
      loading = true;
      authState = Unauthenticated();
      notifyListeners();
      await _authService.logout(loginResponse!.accessToken);
      loginResponse = null;
    } catch (error) {
      loginResponse = null;
    }
  }
}
