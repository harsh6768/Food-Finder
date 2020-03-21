import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'category.dart';

class HorizontalList extends StatefulWidget {
  HorizontalList({Key key}) : super(key: key);

  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  var category = Category();

  List<Category> categoryList;

  Future<List<Category>> parseJsonFromAssets({String assetsPath}) async {
    return rootBundle.loadString('assets/data/category.json').then((jsonStr) {
      var jsonResponse = json.decode(jsonStr);

      categoryList =
          List<Category>.from(jsonResponse.map((x) => Category.fromJson(x)));
      // print(categoryList);
      return Future.value(categoryList);
    });
  }

  // @override
  // void initState() {
  //   parseJsonFromAssets().then((category) {
  //     print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n');
  //     Category.fromJson(category);
  //     print(category);
  //   });

  //   super.initState();
  // }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      child: FutureBuilder(
        future: parseJsonFromAssets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print('>>>>>>>>>>>>>  ${categoryList.length}');
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  var colorCode = categoryList[index].color;

                  return Container(
                    width: 140,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: hexToColor(colorCode),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: Image.asset(
                                      '${categoryList[index].iconUrl}')),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 25.0, left: 10.0),
                              child: Text(
                                '${categoryList[index].catergoryName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 30.0),
                            child: Text(
                              '${categoryList[index].detail}',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          return CircularProgressIndicator(
            backgroundColor: Colors.red,
          );
        },
      ),
    );
  }
}
