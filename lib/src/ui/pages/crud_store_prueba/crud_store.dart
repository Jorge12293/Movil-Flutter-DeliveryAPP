import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudStrore extends StatefulWidget {
  const CrudStrore({Key? key}) : super(key: key);

  @override
  State<CrudStrore> createState() => _CrudStroreState();
}

class _CrudStroreState extends State<CrudStrore> {
  final ProductService _productService =  ProductService();
  List usuarios =[];

  @override
  void initState() {
    super.initState();
   // getUsers();
    guardarProducto();
  }

  void guardarProducto() async {
    Product producto = Product(name: 'martillo', price: 2.5, stock: 23);
    await  _productService.addProduct(producto);
  }
/*
  void getUsers() async{
    CollectionReference _collectionReference = 
      FirebaseFirestore.instance.collection('clientes');
    
    QuerySnapshot users = await _collectionReference.get();
   
    if(users.docs.isNotEmpty){
      for (var doc in users.docs) {
        debugPrint(doc.data().toString());
        usuarios.add(doc.data());
      }
    }
    
  }

 */ 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud'),
      ),
      body: Text('Hola'),
    );
  }
}