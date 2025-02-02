import 'package:flutter/material.dart';

import 'widgets/animated_container.dart';


class HeadphoneShop extends StatefulWidget {
  const HeadphoneShop({super.key});

  @override
  State<HeadphoneShop> createState() => _HeadphoneShopState();
}

class _HeadphoneShopState extends State<HeadphoneShop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _slideAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e64bc),
      body: Stack(children: [
        Column(
          children: [
            SizedBox(
              height: .4 * MediaQuery.sizeOf(context).height,
            ),
            Stack(children: [
              AnimatedContainerWidget(controller: _controller, slideAnimation: _slideAnimation, scaleAnimation: _scaleAnimation),
            ]),
          ],
        ),
        Positioned(
            top: 40,
            left: 10,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        Positioned(
            top: 40,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(.2),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.red[800],
              ),
            )),
        Positioned(
          top: 70,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 300,
            child: Hero(
              tag: 'headphone',
              child: Image.asset(
                "assets/images/headphone.png",
                height: 70,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ]),
    );
  }



}

