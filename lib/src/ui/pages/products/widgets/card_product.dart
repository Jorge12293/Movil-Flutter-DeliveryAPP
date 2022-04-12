import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:appdelivery/src/ui/pages/products/product_form_page.dart';
import 'package:flutter/material.dart';

Widget cardProduct (Product product,BuildContext context) {
  ProductService _productService = ProductService();

  return  Dismissible(
    key: UniqueKey(),
    direction: DismissDirection.startToEnd,
    onDismissed: (direcction) {
       _productService.deleteProduct(product.id as String);
    },
    background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: const Color(0xffce5a5a),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children:const [
              Icon(Icons.delete, color: Colors.black,size: 50),
              Text("DELETE",style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
            ],
          )  
        ),
      ),
    child: ListTile(
      onTap: (){
        Navigator.push( 
          context, 
          MaterialPageRoute(builder: (context) => ProductFormPage(product: product))
        );
      },
      leading: const Icon(Icons.list),
      contentPadding: const EdgeInsets.only(right: 40,left: 40),
      title: Text(product.name),
      subtitle: Text('PU: ${product.price} \$'),
    ),
  );
}