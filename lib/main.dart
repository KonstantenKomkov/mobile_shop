import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/pages/categories_page.dart';
import 'package:shop/pages/products_page.dart';
// import 'package:shop/models/menu.dart';
// import 'package:shop/models/category_list.dart';
// import 'package:shop/models/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.marmeladTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: CategoryGridPage(),
      // routes: {
      //   '/categories': (context) => CategoryGridPage(),
      //   '/products': (context) => ProductListPage(),
      // },
    );
  }
}
