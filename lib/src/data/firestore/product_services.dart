
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:appdelivery/src/domain/repositories/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductService extends ProductRepository {

  final CollectionReference _collectionReference = FirebaseFirestore.instance
    .collection('product');
  
  @override
  Stream<QuerySnapshot<Object?>> productsListening() {
    return  _collectionReference.snapshots();
  }
  
  @override
  Future<List<Product>> listProducts() async{
    QuerySnapshot products = await _collectionReference.get();
    List<Product> listaProductos = [];
    
    if(products.docs.isNotEmpty){
      for (var doc in products.docs) { 
        final tempProduct = Product.fromJson(doc.data()  as Map<String, dynamic>);
        tempProduct.id =  doc.id;
        listaProductos.add(tempProduct);
      }
    }
    return listaProductos;
  }

  @override
  Future<bool> addProduct (Product product) async{
    try{
      Product tempProduct = product.copy();
      await _collectionReference.add(tempProduct.toJson());
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteProduct(String idProduct) async{
    try{
      await _collectionReference.doc(idProduct).delete();
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateProduct(Product product) async{
    try{
      Product tempProduct = product.copy();
      await _collectionReference.doc(product.id as String).update(tempProduct.toJson());
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  
  }
}
  

  
  /*
  @override
  Widget build(BuildContext context) {
      return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
          .collection('myCollection')
          .document('myDocument')
          .snapshots(),
        builder: (context, orderSnapshot) {
          if (!orderSnapshot.data.exists) {
            return Text("Waiting...");
          } else {
            return Text(orderSnapshot);
          }
        });
  }
  */