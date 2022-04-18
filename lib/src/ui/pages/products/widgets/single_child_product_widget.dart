import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:appdelivery/src/ui/pages/products/widgets/card_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SingleChildProductWidget extends StatelessWidget {
  const SingleChildProductWidget({
    Key? key,
    required ProductService productService,
  }) : _productService = productService, super(key: key);

  final ProductService _productService;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _productService.productsListening(), 
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
               if (snapshot.hasError) {
                return const Text('Something went wrong');
               }  
               if (snapshot.connectionState == ConnectionState.waiting) {
                 return const Text("Loading");
               }
            return listaProducts(snapshot,context);
          }),
        ],
      )
    );
  }

  ListView listaProducts(AsyncSnapshot<QuerySnapshot<Object?>> snapshot,BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: snapshot.data!.docs.map( (DocumentSnapshot doc) {
        final tempProduct = Product.fromJson(doc.data()  as Map<String, dynamic>);
        tempProduct.id =  doc.id;
        return cardProduct(tempProduct,context);
      }).toList(),
    );
  }
}