import 'package:flutter/material.dart';

class AddNewUserProvider extends ChangeNotifier {
  final List<String> _userTypes = [
    'Receptionist',
    'Billing Operator',
    'Packager',
    'Delivery Person',
    'Manager',
  ];
  List<String> get userTypes => _userTypes;

  String? _selectedUserType;
  String? get selectedUserType => _selectedUserType;

  final TextEditingController _firstNameController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;

  final TextEditingController _lastNameController = TextEditingController();
  TextEditingController get lastNameController => _lastNameController;

  final TextEditingController _designationController = TextEditingController();
  TextEditingController get designationController => _designationController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  /// set user type
  void setUserType(userType) {
    _selectedUserType = userType;
    notifyListeners();
  }
}
