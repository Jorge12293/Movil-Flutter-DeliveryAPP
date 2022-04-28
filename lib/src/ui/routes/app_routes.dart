import 'package:appdelivery/src/pruebas/dialogs/pages/home_page.dart';
import 'package:appdelivery/src/ui/pages/company/company_form_page.dart';
import 'package:appdelivery/src/ui/pages/company/company_page.dart';
import 'package:appdelivery/src/ui/pages/home/home_page.dart';
import 'package:appdelivery/src/ui/pages/map_location/map_location_page.dart';
import 'package:appdelivery/src/ui/pages/products/product_form_page.dart';
import 'package:appdelivery/src/ui/pages/products/product_page.dart';
import 'package:appdelivery/src/ui/pages/shopping_cart/shopping_cart_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes{

  //static const initialRoute = 'home';
  static const initialRoute = 'pageDialog';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home' : (BuildContext context) => const HomePage(),

    'products' : (BuildContext context) => const ProductPage(),
    'productForm' : (BuildContext context) => ProductFormPage(),

    'company' : (BuildContext context) => const CompanyPage(),
    'companyForm' : (BuildContext context) => const CompanyFormPage(),

    'shoppingCart' : (BuildContext context) =>  ShoppingCartPage(),    

    'mapLocation' : (BuildContext context) =>const MapLocationPage(),


    //Pruebas
    'pageDialog' : (BuildContext context) => HomePageDialog(),
    

  };

}