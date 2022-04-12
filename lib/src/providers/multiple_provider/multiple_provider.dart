import 'package:appdelivery/src/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class MultipleProviders {

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_)=> ProductProvider()),
  ];

}