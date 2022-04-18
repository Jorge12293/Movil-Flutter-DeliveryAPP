import 'package:appdelivery/src/app.dart';
import 'package:appdelivery/src/provider/multiple_provider/multiple_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    MultiProvider(
      providers: MultipleProviders.providers,
      child: const App(),
    )
  );
}
