import 'package:flutter/material.dart';
import './widgets/BottomNavBar.dart';
import 'package:splashscreen/splashscreen.dart';
import './widgets/HomePage.dart';
import './widgets/Libaray.dart';
import './widgets/Premium.dart';
import './widgets/Search.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      navigateAfterSeconds: new HomeScreen(),
      image: Image(
          alignment: Alignment.topCenter, image: AssetImage("images/logo.png")),
      // backgroundColor: Color(0xff10133b),
      gradientBackground: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[Color(0xff0F0C29), Color(0xff241C66)],
      ),
      photoSize: 130.0,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var array = [
    HomePage(),
    Search(),
    Libaray(),
    Premium(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff171a41),
        centerTitle: true,
        title: Text(
          "Musicarol",
        ),
      ),
      body: array[currentIndex],
      bottomNavigationBar: ButtonCustomNavigationBar(),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      // currentIndex = index;
    });
  }
}
