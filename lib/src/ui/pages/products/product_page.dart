import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/ui/pages/products/widgets/single_child_product_widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState();

}

class _ProductPageState extends State<ProductPage> {
  
  final ProductService _productService = ProductService();

  @override
  void initState() {
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
      body: SingleChildProductWidget(productService: _productService),
    );
  }
}



  