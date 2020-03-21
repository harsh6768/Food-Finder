import 'package:flutter/material.dart';
import 'seafood_list.dart';
import 'collection_list.dart';
import 'bottom_navigation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 10.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Hello Lulu',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: null,
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'China,Beijing',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '250k',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        'Follower',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '500',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        'Following',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '500',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        'Teste Master',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 30.0, bottom: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Your Favorite',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 100,
                          color: Colors.red,
                        ),
                        SeafoodList()
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 30.0, left: 10.0, bottom: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Text(
                              'Your Collection',
                              style: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.settings_voice,
                              // color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    CollectionList()
                  ],
                ),
              ),
              Positioned(   // we can only Positioned widget inside stack
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomNavigation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
