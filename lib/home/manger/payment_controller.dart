import 'dart:developer';
import 'package:get/get.dart';
import 'package:headphone_payment/home/data/models/payment_intent_input_model.dart';
import 'package:headphone_payment/home/data/repos/checkout_repo.dart';

class PaymentController extends GetxController {
  final CheckoutRepo checkoutRepo;
  PaymentController({required this.checkoutRepo});

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _error = ''.obs;
  String get error => _error.value;

  final _isSuccess = false.obs;
  bool get isSuccess => _isSuccess.value;

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    _isLoading.value = true;
    _error.value = '';
    _isSuccess.value = false;

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((failure) {
      _error.value = failure.errMessage;
      _isLoading.value = false;
    }, (success) {
      _isSuccess.value = true;
      _isLoading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    ever(_isLoading, (_) => log('Loading state changed: $_isLoading'));
    ever(_error, (_) => log('Error state changed: $_error'));
    ever(_isSuccess, (_) => log('Success state changed: $_isSuccess'));
  }
}
