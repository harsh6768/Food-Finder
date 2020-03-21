import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'treding.dart';

class TrendingBrandList extends StatefulWidget {
  @override
  _TrendingBrandListState createState() => _TrendingBrandListState();
}

class _TrendingBrandListState extends State<TrendingBrandList> {
  var category = TrendingBrands();

  List<TrendingBrands> trendingBrandsList;

  Future<List<TrendingBrands>> parseJsonFromAssets({String assetsPath}) async {
    return rootBundle.loadString('assets/data/trending.json').then((jsonStr) {
      var jsonResponse = json.decode(jsonStr);

      // print(jsonResponse);
      trendingBrandsList = List<TrendingBrands>.from(
          jsonResponse.map((x) => TrendingBrands.fromJson(x)));
      // print(trendingBrandsList);
      return Future.value(trendingBrandsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: parseJsonFromAssets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                height: 150.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingBrandsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(left: 8.0, right: 8.0,top: 10.0,bottom: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15.0,
                              // spreadRadius: 5.0,
                              color: Colors.grey.shade400,
                              offset: Offset(3.0, 3.0),
                            )
                          ],
                        ),
                        height: 200.0,
                        width: 120.0,
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                  '${trendingBrandsList[index].brandUrl}'),
                            ),
                          ),
                        ),
                      );
                    }));
          }
          return CircularProgressIndicator(
            backgroundColor: Colors.red,
          );
        },
      ),
    );
  }
}
