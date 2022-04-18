import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:flutter/material.dart';

Widget cardProductWidget(Product _product) {

 Color customBlackColor = const Color.fromARGB(255,53, 53, 53);
 Color customWhiteColor = const Color.fromARGB(255,237, 237, 237);

  return  Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: customWhiteColor,
    boxShadow: const [
      BoxShadow(
        blurRadius: 30.0,
        offset: Offset(20, 20),
        color: Colors.grey,
       ),
       BoxShadow(
        blurRadius: 30.0,
        offset:Offset(-20, -20),
        color: Colors.white,
      ),  
      ]),
   child:GestureDetector(
     onTap: (){
       debugPrint(_product.id);
     },
     child: SizedBox(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add_shopping_cart_rounded ,color: Colors.black,size: 40),
              ),
              Text(_product.name.toUpperCase(),style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold)),
              Text('${_product.price} \$'),
            ],
          ),
        )
      ),
   ),
  );
}