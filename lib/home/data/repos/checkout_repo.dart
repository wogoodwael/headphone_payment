import 'package:dartz/dartz.dart';
import 'package:headphone_payment/core/errors/failures.dart';
import 'package:headphone_payment/home/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
