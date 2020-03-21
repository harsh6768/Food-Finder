import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'collection.dart';

class CollectionList extends StatefulWidget {
  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  var seaFood = Collection();

  List<Collection> collectionList;

  Future<List<Collection>> parseJsonFromAssets({String assetsPath}) async {
    return rootBundle.loadString('assets/data/collection.json').then((jsonStr) {
      var jsonResponse = json.decode(jsonStr);

      // print(jsonResponse);
      collectionList = List<Collection>.from(
          jsonResponse.map((x) => Collection.fromJson(x)));
      // print(collectionList);
      return Future.value(collectionList);
    });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.0,
      width: 500.0,
      child: FutureBuilder(
          future: parseJsonFromAssets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print('>>>>>>>>>>>>>  ${categoryList.length}');
              return ListView.builder(
                  itemCount: collectionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var colorCode = collectionList[index].color;

                    return Container(
                      height: 160,
                      width: 220,
                      child: Card(
                          margin:
                              EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          // color: hexToColor(colorCode),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Container(
                                          height: 110.0,
                                          width: 150.0,
                                          color: hexToColor(colorCode),
                                          child: Image.asset(
                                            '${collectionList[index].imageUrl}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    '${collectionList[index].name}',
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${collectionList[index].description}',
                                                    style: TextStyle(
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 20.0, left: 10.0),
                                            child: Row(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: List.generate(
                                                      int.parse(
                                                          collectionList[index]
                                                              .ratings),
                                                      (index) {
                                                    return Icon(
                                                      Icons.star,
                                                      color: Colors.red,
                                                    );
                                                  }),
                                                ),
                                                Text(
                                                  '${collectionList[index].reviews}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
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
