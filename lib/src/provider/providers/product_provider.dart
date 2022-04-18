import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _listProducts =[];

  List<Product> get listProducts=> _listProducts;

  set listProducts(List<Product> value){
    _listProducts = value;
    notifyListeners();
  }
  
}