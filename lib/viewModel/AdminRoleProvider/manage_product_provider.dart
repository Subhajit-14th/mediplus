import 'package:flutter/material.dart';

class ManageProductProvider extends ChangeNotifier {
  /// Dummy Product Data
  List<String> _productList = [
    "PAN MPS",
    "PARACETAMOL 1000",
    "TEST PRODUCT",
    "Pan D",
    "Calpoll",
    "Cetirizine HCL -100",
    "Paracetamol -650"
  ];
  List<String> get productList => _productList;

  final TextEditingController _addNewProductController =
      TextEditingController();
  TextEditingController get addNewProductController => _addNewProductController;

  final TextEditingController _editProductController = TextEditingController();
  TextEditingController get editProductController => _editProductController;

  /// add new product
  void addNewProduct(productName) {
    _productList.add(productName);
    notifyListeners();
  }

  /// remove product
  void removeProduct(index) {
    _productList.removeAt(index);
    notifyListeners();
  }

  /// Edit Product name
  void updateProduct(int index, String newName) {
    _productList[index] = newName;
    notifyListeners();
  }
}
