import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:headphone_payment/core/functions/get_transctions.dart';
import 'package:headphone_payment/core/utils/api_keys.dart';
import 'package:headphone_payment/core/utils/strings.dart';
import 'package:headphone_payment/home/data/models/amount_model/amount_model.dart';
import 'package:headphone_payment/home/data/models/amount_model/details.dart';
import 'package:headphone_payment/home/data/models/item_list_model/item_list_model.dart';
import 'package:headphone_payment/home/data/models/payment_intent_input_model.dart';
import 'package:headphone_payment/home/data/repos/checkout_repo_impl.dart';
import 'package:headphone_payment/home/manger/payment_controller.dart';
import 'package:headphone_payment/home/thank_you.dart';

import '../../home/data/models/item_list_model/item.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  int isTapped = 0;
  final paymentController =
      Get.put(PaymentController(checkoutRepo: CheckoutRepoImpl()));

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
                    isTapped = index;
                  });
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
          Obx(() {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: paymentController.isLoading
                  ? null
                  : isTapped == 0
                      ? () async {
                          final paymentIntentInputModel =
                              PaymentIntentInputModel(
                            amount: '450',
                            currency: 'USD',
                            cusomerId: 'cus_Rhrgmx0kVBDdn9',
                          );
                          await paymentController.makePayment(
                              paymentIntentInputModel: paymentIntentInputModel);
                          if (paymentController.isSuccess) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ThankYouView()));
                          }
                          //paypal integration
                        }
                      : () {
                          var transactionData = getTransctionsData();
                          ExcutePaypalPayment(context, transactionData);
                        },
              child: paymentController.isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Continue"),
            );
          })
        ],
      ),
    );
  }

  void ExcutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.clientSecret,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ThankYouView()));
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
