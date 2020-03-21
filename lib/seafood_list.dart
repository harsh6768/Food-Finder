import 'package:flutter/material.dart';
import 'dart:convert';
import 'seafood.dart';
import 'package:flutter/services.dart' show rootBundle;

class SeafoodList extends StatefulWidget {
  @override
  _SeafoodListState createState() => _SeafoodListState();
}

class _SeafoodListState extends State<SeafoodList> {
  var seaFood = Seafood();

  List<Seafood> seafoodList;

  Future<List<Seafood>> parseJsonFromAssets({String assetsPath}) async {
    return rootBundle.loadString('assets/data/seafood.json').then((jsonStr) {
      var jsonResponse = json.decode(jsonStr);

      // print(jsonResponse);
      seafoodList =
          List<Seafood>.from(jsonResponse.map((x) => Seafood.fromJson(x)));
      // print(seafoodList);
      return Future.value(seafoodList);
    });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      
      child: FutureBuilder(
          future: parseJsonFromAssets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print('>>>>>>>>>>>>>  ${categoryList.length}');
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: seafoodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var colorCode = seafoodList[index].color;

                    return Container(
                      height: 260,
                      width: 220,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Card(
                            // elevation: 8.0,
                            color: hexToColor(colorCode),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            // color: hexToColor(colorCode),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 18.0),
                                  child: Text(
                                    '${seafoodList[index].seafoodName}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '${seafoodList[index].seafoodDescription}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 50.0, left: 40.0),
                                  child: GridTile(
                                    child: Image.asset(
                                      '${seafoodList[index].seafoodUrl}',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.red,
            );
          }),
    );
  }
}
