import 'package:flutter/material.dart';

import 'package:headphone_payment/home/widgets/check_circle_avatar.dart';
import 'package:headphone_payment/home/widgets/content_column.dart';

import 'widgets/dashed_line.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blue[100]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 43.0 + 16, left: 22, right: 22),
                  child: ContentColumn(),
                ),
              ),
              Positioned(
                  bottom: .2 * MediaQuery.sizeOf(context).height,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              Positioned(
                  bottom: .2 * MediaQuery.sizeOf(context).height,
                  right: -20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              CheckCircleAvatar(),
              DashedLine()
            ],
          ),
        ),
      ),
    );
  }
}
