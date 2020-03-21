import 'package:flutter/material.dart';
import 'dart:convert';
import 'popular.dart';
import 'package:flutter/services.dart' show rootBundle;

class PopularEatries extends StatefulWidget {
  PopularEatries({Key key}) : super(key: key);

  @override
  _PopularEatriesState createState() => _PopularEatriesState();
}

class _PopularEatriesState extends State<PopularEatries> {
  var popularEatires = PopularEat();

  List<PopularEat> popularEatriesList;

  Future<List<PopularEat>> parseJsonFromAssets({String assetsPath}) async {
    return rootBundle.loadString('assets/data/popular.json').then((jsonStr) {
      var jsonResponse = json.decode(jsonStr);

      // print(jsonResponse);
      popularEatriesList = List<PopularEat>.from(
          jsonResponse.map((x) => PopularEat.fromJson(x)));
      // print(popularEatriesList);
      return Future.value(popularEatriesList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      // width: 200.0,
      child: FutureBuilder(
          future: parseJsonFromAssets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print('>>>>>>>>>>>>>  ${categoryList.length}');
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularEatriesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 10.0,
                            color: Colors.white,
                            // offset: Offset(5.0, 0),
                          )
                        ],
                      ),
                      width: 260,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              '${popularEatriesList[index].url}',
                              fit: BoxFit.fitWidth,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '${popularEatriesList[index].name}',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  Text(
                                    '${popularEatriesList[index].description}',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black54),
                                  )
                                ],
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
          }),
    );
  }
}
