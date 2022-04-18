import 'package:appdelivery/src/provider/providers/map_location_provider.dart';
import 'package:appdelivery/src/provider/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class MultipleProviders {

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_)=> ProductProvider()),
    ChangeNotifierProvider(create: (_)=> MapLocationProvider()),
  ];

}