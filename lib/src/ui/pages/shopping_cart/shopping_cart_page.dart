import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/ui/pages/shopping_cart/widgets/single_child_shopping_cart_widget.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({Key? key}) : super(key: key);
  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
final ProductService _productService = ProductService();

@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Shopping Cart'),
              Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 35),
            ],
          ),
        ),
        body:SingleChildShoppingCartWidget(productService: _productService)
      )
    );
  }
}