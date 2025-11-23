import 'package:e_comrcee_with_api_with_gad/Providers/AuthProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Providers/CartProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Providers/ProductProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authprovider(),),
        ChangeNotifierProvider(create: (context) => Productprovider(),),
        ChangeNotifierProvider(create: (context) => Cartprovider(),),
      ],
      child: MaterialApp(
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
