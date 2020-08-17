import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:musicarol/screens/carousel.dart';
import 'package:musicarol/screens/songs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xff0F0C29),
              Color(0xff2e0101),
            ],
          ),
        ),
        child: Container(
            child: Row(
          children: <Widget>[
            Songs(),
            Carousel(),
          ],
        )),
        // Songs(),
        // ],
        // ),

        //   ],
        // ),
      ),
    );
  }
}
