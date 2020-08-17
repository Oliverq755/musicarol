import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> images = [
    'images/p1.jpg',
    'images/p2.jpg',
    'images/p3.jpg',
    'images/p4.jpg',
    'images/p5.png',
    'images/p6.jpeg',
  ];

  PageController pageController;

  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return SizedBox(
          height: Curves.easeInOut.transform(value) * 100,
          width: Curves.easeInOut.transform(value) * 200,
          child: widget,
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.asset(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context, position) {
          return imageSlider(position);
        },
      ),
    );
  }
}
