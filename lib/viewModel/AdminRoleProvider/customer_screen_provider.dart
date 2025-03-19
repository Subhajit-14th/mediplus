import 'package:flutter/material.dart';
import 'package:mediplus/model/AdminRoleModels/customer_model.dart';

class CustomerScreenProvider extends ChangeNotifier {
  final List<CustomerModel> _customerModel = [
    CustomerModel(
      name: "Krishna Roy",
      mobile: "14523698744",
      patients: "Abhijit",
    ),
    CustomerModel(
      name: "Sharnik Roy",
      mobile: "9609566523",
      patients: "Bibha Roy",
    ),
    CustomerModel(
      name: "Koushik Talukder",
      mobile: "7908881231",
      patients: "Blki Sa, Raj",
    ),
    CustomerModel(name: "Gourav", mobile: "9204388804", patients: "Test"),
    CustomerModel(
        name: "SANDEEP GOYAL", mobile: "8092098551", patients: "NEHA GOYAL"),
    CustomerModel(
        name: "Abineshwar Bisoi",
        mobile: "8348375874",
        patients: "Abineshwar Bisoi"),
    CustomerModel(
        name: "KAUSHIK TALUKDER", mobile: "9933676195", patients: "kt"),
    CustomerModel(
        name: "Sahadev Roy", mobile: "9733812121", patients: "Bibha Roy"),
  ];

  List<CustomerModel> get customerModel => _customerModel;
}
