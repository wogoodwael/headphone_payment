import 'package:flutter/material.dart';
import 'package:headphone_payment/core/widgets/bottom_sheet.dart';
import 'package:headphone_payment/home/widgets/build_feature_icon.dart';

class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget({
    super.key,
    required AnimationController controller,
    required Animation<double> slideAnimation,
    required Animation<double> scaleAnimation,
  })  : _controller = controller,
        _slideAnimation = slideAnimation,
        _scaleAnimation = scaleAnimation;

  final AnimationController _controller;
  final Animation<double> _slideAnimation;
  final Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Beats',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Studio 3 Wireless',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "(126 reviwes)",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 20,
                      children: [
                        buildFeatureIcon(Icons.wifi, 'Wireless'),
                        buildFeatureIcon(Icons.bluetooth, 'Bluetooth'),
                        buildFeatureIcon(Icons.battery_full, 'Battery'),
                      ],
                    ),
                    Text(
                        "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standar, when an unknown printer...read more"),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$450',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
                            showModalBottomSheet(
                                backgroundColor: Colors.blue[50],
                                context: context,
                                builder: (context) {
                                  return BottomSheetWidget();
                                });
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 25,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff1e64bc),
                            minimumSize: Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Column(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                        decoration:
                            BoxDecoration(color: Colors.blue.withOpacity(.1)),
                        child: Center(child: Icon(Icons.minimize_outlined)),
                      ),
                      Text(
                        "01",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(color: Colors.blue[700]),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      ),
                    ],
                  ))
            ]),
          ),
        );
      },
    );
  }
}
