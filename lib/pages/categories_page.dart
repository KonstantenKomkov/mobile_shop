import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/menu.dart';
import 'package:shop/helpers/constants.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoryPage> {
  DataFetch _categoryFetch = new DataFetch();

  Future<List<Category>> _getCategory() async {
    var categories = await _categoryFetch.getCategory();
    return categories;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2),
                  child: Text(
                    "Категории",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Menu(),
                Expanded(
                  child: FutureBuilder(
                      future: _getCategory(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(
                              child: Text("Загрузка..."),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2),
                              child: GridView.builder(
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: kDefaultPadding / 2,
                                  crossAxisSpacing: kDefaultPadding / 2,
                                ),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        snapshot.data[index],
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ]),
        ),
      ),
    );
  }
}
