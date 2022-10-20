import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';

import 'controller/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBPg0e4hhMIFh4B6IZIyDBm-4aL1TofXRk",
      appId: "1:612951915731:web:0723e206da5b4db9fca826",
      messagingSenderId: "612951915731",
      projectId: "placecat",
      authDomain: "placecat.firebaseapp.com",
      storageBucket: "placecat.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: appRoutes(),
    );
  }
}
