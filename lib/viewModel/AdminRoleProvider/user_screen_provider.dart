import 'package:flutter/material.dart';
import 'package:mediplus/model/AdminRoleModels/user_models.dart';

class UserScreenProvider extends ChangeNotifier {
  final List<User> _userList = [
    User(
        userType: "Receptionist",
        firstName: "Soma",
        lastName: "Lee",
        designation: "Receptionist",
        email: "soma@gmail.com"),
    User(
        userType: "Billing operator",
        firstName: "Sudarshan",
        lastName: "Halder",
        designation: "Billing Operator",
        email: "sudarshan@gmail.com"),
    User(
        userType: "Packager",
        firstName: "Rana",
        lastName: "Chakrabory",
        designation: "Packager",
        email: "rana@gmail.com"),
    User(
        userType: "Delivery person",
        firstName: "Shusovan",
        lastName: "Roy",
        designation: "Delivery Boy",
        email: "shusovan@gmail.com"),
    User(
        userType: "Manager",
        firstName: "Koushik",
        lastName: "Talukdar",
        designation: "Manager",
        email: "kaushik@gmail.com"),
    User(
        userType: "Delivery person",
        firstName: "Koushik",
        lastName: "Talukdar",
        designation: "Delivery Boy",
        email: "kt@gmail.com"),
    User(
        userType: "Receptionist",
        firstName: "Raj",
        lastName: "Gupta",
        designation: "Rescep",
        email: "rg@gmail.com"),
    User(
        userType: "Receptionist",
        firstName: "SANA",
        lastName: "PARVEEN",
        designation: "RECEPTIONIST",
        email: "sana@mymediworld.com"),
  ];
  List<User> get userList => _userList;
}
