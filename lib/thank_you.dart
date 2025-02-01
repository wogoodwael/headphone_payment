import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';

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
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.blue[100]),
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
              Positioned(
                top: -43,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 43,
                  backgroundColor: Colors.blue[100],
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.blue[700],
                    child: Icon(Icons.check, size: 40, color: Colors.white,),
                  ),
                ),
               
              ),
              Positioned(
                  bottom: .22 * MediaQuery.sizeOf(context).height,
                  left: 25,
                child: Row(
                children: List.generate(11, (int index){
                  return Container(
                    margin: EdgeInsets.all(2),
                    height: 2,
                    width: 20,
                    color: Colors.blue,
                  );
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
