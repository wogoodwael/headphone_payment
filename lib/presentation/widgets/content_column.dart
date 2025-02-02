import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headphone_payment/presentation/widgets/card_info_widget.dart';
import 'package:headphone_payment/core/utils/styles.dart';
import 'package:headphone_payment/presentation/widgets/payment_info_item.dart';
import 'package:headphone_payment/presentation/widgets/total_price_widget.dart';

class ContentColumn extends StatelessWidget {
  const ContentColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Thank you!',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Your transaction was successful',
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        const SizedBox(
          height: 42,
        ),
        const PaymentItemInfo(
          title: 'Date',
          value: '01/24/2023',
        ),
        const SizedBox(
          height: 20,
        ),
        const PaymentItemInfo(
          title: 'Time',
          value: '10:15 AM',
        ),
        const SizedBox(
          height: 20,
        ),
        const PaymentItemInfo(
          title: 'To',
          value: 'Sam Louis',
        ),
        Divider(
          height: 60,
          thickness: 2,
          color: Colors.blue[200],
        ),
        const TotalPrice(title: 'Total', value: r'$50.97'),
        const SizedBox(
          height: 30,
        ),
        const CardInfoWidget(),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              FontAwesomeIcons.barcode,
              size: 64,
            ),
            Container(
              width: 113,
              height: 58,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.50,
                    color: Color(0xff1e64bc),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'PAID',
                  textAlign: TextAlign.center,
                  style: Styles.style24.copyWith(
                    color: const Color(0xff1e64bc),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
        ),
      ],
    );
  }
}
