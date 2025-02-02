import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:headphone_payment/core/utils/strings.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  int isTapped = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = index; // Fixed assignment operator
                  });
                  print(isTapped);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.all(10),
                  width: 80,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: isTapped == index
                              ? Colors.grey
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                      color: isTapped == index
                          ? Colors.white
                          : Colors.transparent),
                  child: Center(
                      child: SvgPicture.asset(
                    img[index],
                    height: 40,
                    fit: BoxFit.scaleDown,
                  )),
                ),
              );
            }),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                minimumSize: Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {},
            child: Text("Continue"),
          )
        ],
      ),
    );
  }
}
