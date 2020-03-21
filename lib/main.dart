import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_design/category_list.dart';
import 'package:test_design/popular_eatries.dart';
import 'package:test_design/trending_brands.dart';
import 'package:test_design/profile.dart';
import 'package:test_design/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //to make the full screen
    // SystemChrome.setEnabledSystemUIOverlays([]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routes
      routes: <String, WidgetBuilder>{
        '/profile': (BuildContext context) => Profile(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
            builder: (context) => Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Hello Lulu',
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text('China,Beijing',
                                              style: TextStyle(fontSize: 16.0)),
                                          InkWell(
                                            onTap: null,
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.redAccent,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                                  SizedBox(
                                    width: 150.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print('hell harsh');
                                      Navigator.pushNamed(context, '/profile');
                                    },
                                    child: Container(
                                      width: 60.0,
                                      height: 60.0,
                                      child: Image.asset(
                                          'assets/images/ice-cream.png',
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.black12),
                                      height: 60.0,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: null,
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.search),
                                              border: InputBorder.none,
                                              hintText: 'Find your food here'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.black12),
                                      height: 60.0,
                                      width: 60.0,
                                      child: Icon(
                                        Icons.filter_list,
                                        size: 48.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            HorizontalList(),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, bottom: 20.0, left: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Popular Eatries',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    width: 120.0,
                                  ),
                                  Text(
                                    'View all',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.redAccent),
                                  )
                                ],
                              ),
                            ),
                            PopularEatries(),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, bottom: 20.0, left: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Trending Brands',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            TrendingBrandList()
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BottomNavigation(),
                    ),
                  ],
                )),
      ),
    );
  }
}
