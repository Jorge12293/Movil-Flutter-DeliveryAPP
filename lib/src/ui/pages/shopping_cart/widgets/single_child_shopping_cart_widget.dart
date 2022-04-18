import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:appdelivery/src/ui/pages/shopping_cart/widgets/card_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SingleChildShoppingCartWidget extends StatefulWidget {
  const SingleChildShoppingCartWidget({
    Key? key,
    required ProductService productService,
  }) : _productService = productService, super(key: key);

  final ProductService _productService;
  
  @override
  State<SingleChildShoppingCartWidget> createState() => _SingleChildShoppingCartWidgetState();
}

class _SingleChildShoppingCartWidgetState extends State<SingleChildShoppingCartWidget>{


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
              StreamBuilder<QuerySnapshot>(
                stream: widget._productService.productsListening(), 
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

  listaProducts(AsyncSnapshot<QuerySnapshot<Object?>> snapshot,BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(bottom: 20),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      childAspectRatio: 3/2,
      crossAxisCount: 2,
      children: snapshot.data!.docs.map( (DocumentSnapshot doc) {
          final tempProduct = Product.fromJson(doc.data()  as Map<String, dynamic>);
          tempProduct.id =  doc.id;
          return cardProductWidget(tempProduct);
        }
      ).toList(),
    );
  }
}