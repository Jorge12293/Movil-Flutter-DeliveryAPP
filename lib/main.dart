import 'package:appdelivery/src/app.dart';
import 'package:appdelivery/src/provider/multiple_provider/multiple_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);

  // Settings(host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  

  runApp(
    MultiProvider(
      providers: MultipleProviders.providers,
      child:  App(),
    )
  );
}
