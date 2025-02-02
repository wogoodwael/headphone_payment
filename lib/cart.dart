// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:headphone_payment/core/utils/strings.dart';
// import 'package:headphone_payment/presentation/thank_you.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
// // isTapped is null because it's declared as nullable (int?) but never initialized
// // Let's initialize it to -1 to indicate no selection initially
//   int isTapped = -1;
//   String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
//   bool isCvvFocused = false;
//   final GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       appBar: AppBar(
//         elevation: 0,
//         surfaceTintColor: Colors.white,
//         backgroundColor: Colors.transparent,
//         leading: Icon(Icons.arrow_back_ios),
//         title: Text(
//           "Choose payment method",
//           style: TextStyle(color: Colors.grey, fontSize: 16),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             spacing: 10,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(2, (int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isTapped = index; // Fixed assignment operator
//                       });
//                       print(isTapped);
//                     },
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       margin: EdgeInsets.all(10),
//                       width: 80,
//                       height: 70,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: isTapped == index
//                                   ? Colors.grey
//                                   : Colors.transparent),
//                           borderRadius: BorderRadius.circular(10),
//                           color: isTapped == index
//                               ? Colors.white
//                               : Colors.transparent),
//                       child: Center(
//                           child: SvgPicture.asset(
//                         img[index],
//                         height: 40,
//                         fit: BoxFit.scaleDown,
//                       )),
//                     ),
//                   );
//                 }),
//               ),
//               isTapped == 0
//                   ? Column(
//                       children: [
//                         CreditCardWidget(
//                           cardType: CardType.mastercard,
//                           cardBgColor: Colors.black,
//                           cardNumber: cardNumber,
//                           expiryDate: expiryDate,
//                           cardHolderName: cardHolderName,
//                           cvvCode: cvvCode,
//                           isHolderNameVisible: true,
//                           showBackView:
//                               isCvvFocused, //true when you want to show cvv(back) view
//                           onCreditCardWidgetChange: (CreditCardBrand
//                               brand) {}, // Callback for anytime credit card brand is changed
//                         ),
//                         CreditCardForm(
//                             cardNumber: cardNumber,
//                             expiryDate: expiryDate,
//                             cardHolderName: cardHolderName,
//                             cvvCode: cvvCode,
//                             onCreditCardModelChange: (CreditCardModel) {
//                               cardHolderName = CreditCardModel.cardHolderName;
//                               cardNumber = CreditCardModel.cardNumber;
//                               cvvCode = CreditCardModel.cvvCode;
//                               expiryDate = CreditCardModel.expiryDate;
//                               isCvvFocused = CreditCardModel.isCvvFocused;
//                               setState(() {});
//                             },
//                             formKey: formKey),
//                         SizedBox(
//                           height: .05 * MediaQuery.sizeOf(context).height,
//                         ),
//                         ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue[800],
//                                 foregroundColor: Colors.white,
//                                 minimumSize: Size(300, 50),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 formKey.currentState!.save();
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => ThankYouView()));
//                               } else {
//                                 autovalidateMode = AutovalidateMode.always;
//                                 setState(() {});
//                               }
//                             },
//                             child: Text("Pay"))
//                       ],
//                     )
//                   : Container()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
