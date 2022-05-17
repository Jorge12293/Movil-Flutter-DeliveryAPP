import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/data/http/article_service.dart';
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:appdelivery/src/ui/pages/products/widgets/card_product.dart';
import 'package:appdelivery/src/ui/pages/products/widgets/single_child_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductService _productService = ProductService();
  // FirebaseFirestore db = FirebaseFirestore.instance;
   
var firestore = FirebaseFirestore;

  @override
  void initState() {
    

      FirebaseFirestore.instance.enableNetwork().then((_) {
     print('disableNetwork() ===================================================>');
   });

  
   super.initState();
  
  }

 

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context,'productForm').then((value) =>{
            if(value!=null){ }
          });
        },
        tooltip: 'Increment',
        child:const Icon(Icons.add),
      ),
      body: SingleChildProductWidget(productService: _productService)
    );
  }



}



  