
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProductRepository{
  Future<bool> addProduct(Product product);
  Future<bool> deleteProduct(String idProduct);
  Future<bool> updateProduct(Product product);

  Future<List<Product>> listProducts();
  Stream<QuerySnapshot> productsListening();
}