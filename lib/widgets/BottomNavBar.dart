import 'package:flutter/material.dart';

class ButtonCustomNavigationBar extends StatefulWidget {
  @override
  _ButtonCustomNavigationBarState createState() =>
      _ButtonCustomNavigationBarState();
}

class _ButtonCustomNavigationBarState extends State<ButtonCustomNavigationBar> {
  int selectedIndex = 0;
  String selectedMenuName = '';
  Color backgroundColor = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
      Icon(Icons.home),
      Text("Home"),
      Colors.deepPurpleAccent,
    ),
    NavigationItem(
      Icon(Icons.favorite_border),
      Text("Favourite"),
      Colors.pinkAccent,
    ),
    NavigationItem(
      Icon(Icons.search),
      Text("Search"),
      Colors.amberAccent,
    ),
    NavigationItem(
      Icon(Icons.person),
      Text("Profile"),
      Colors.cyan,
    ),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: isSelected ? 120 : 50,
      height: double.maxFinite,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: BoxDecoration(
        color: isSelected ? item.color : null,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTheme(
                  data: IconThemeData(
                    size: 24,
                    color: isSelected ? backgroundColor : Colors.grey,
                  ),
                  child: item.icon),
              isSelected
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: item.title,
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff0F0C29),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;
  NavigationItem(this.icon, this.title, this.color);
}
