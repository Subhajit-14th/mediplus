import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _isAuthenticate = false;
  bool get isAuthenticate => _isAuthenticate;

  String _role = "";
  String get role => _role;

  void login() async {
    if (_emailController.text == 'admin@gmail.com' &&
        _passwordController.text == 'Admin@1234') {
      _role = "Admin";
    } else if (_emailController.text == 'soma@gmail.com' &&
        _passwordController.text == '123456') {
      _role = "Receptionist";
    } else if (_emailController.text == 'sudarshan@gmail.com' &&
        _passwordController.text == "123456") {
      _role = "Billing operator";
    } else if (_emailController.text == 'rana@gmail.com' &&
        _passwordController.text == '123456') {
      _role = "Packager";
    } else if (_emailController.text == 'shusovan@gmail.com' &&
        _passwordController.text == '123456') {
      _role = "Delivery person";
    } else if (_emailController.text == 'kaushik@gmail.com' &&
        _passwordController.text == '123456') {
      _role = "Manager";
    }
    notifyListeners();
  }
}
