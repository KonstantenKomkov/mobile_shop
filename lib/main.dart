import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/models/menu.dart';
import 'package:shop/models/category_list.dart';
import 'package:shop/models/product_list.dart';

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
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Expanded(
              child: Column(children: [
                Menu(),
                ProductListItem(),
                //CategoryGridItem(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
