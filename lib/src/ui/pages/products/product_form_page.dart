import 'package:appdelivery/src/data/firestore/product_services.dart';
import 'package:appdelivery/src/domain/entities/product.dart';
import 'package:appdelivery/src/ui/pages/products/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductFormPage extends StatefulWidget {
  ProductFormPage({this.product});
  
  Product? product;
   
  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final ProductService _productService = ProductService();

  String idProducto='';
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  void initState() {
    if(widget.product != null){
      idProducto = widget.product?.id as String;
      nameController.text = widget.product?.name as String;
      priceController.text = widget.product!.price.toString();
      stockController.text = widget.product!.stock.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         title:const Text('Product..'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color:Colors.black),
                decoration: inputDecoration("Product Name",nameController),
                controller: nameController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style:const TextStyle(color:Colors.black),
                keyboardType: TextInputType.number,
                decoration: inputDecoration("Product Price",priceController),
                controller: priceController,
              ),
                            const SizedBox(height: 20),
              TextFormField(
                style:const TextStyle(color:Colors.black),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: inputDecoration("Product stock",stockController),
                controller: stockController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: ElevatedButton(
            onPressed: () async {

              Product product =  Product(
                id: idProducto,
                name: nameController.text, 
                price: double.parse(priceController.text), 
                stock: int.parse(stockController.text)
              );
              
              if(idProducto.isEmpty){
                await _productService.addProduct(product); 
              }else{
                await _productService.updateProduct(product); 
              }
          
              Navigator.pop(context,true);
            },
            child:(idProducto == '') 
              ?Text("Save",style: TextStyle(color: Colors.white))
              :Text("Update",style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }

}