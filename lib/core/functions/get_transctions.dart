
import 'package:headphone_payment/home/data/models/amount_model/amount_model.dart';
import 'package:headphone_payment/home/data/models/amount_model/details.dart';
import 'package:headphone_payment/home/data/models/item_list_model/item.dart';
import 'package:headphone_payment/home/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
  var amount = AmountModel(
      total: "450",
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '450'));

  List<OrderItemModel> orders = [
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "10",
      quantity: 30,
    ),
    OrderItemModel(
      currency: 'USD',
      name: 'Apple',
      price: "5",
      quantity: 30,
    ),
  ];

  var itemList = ItemListModel(items: orders);

  return (amount: amount, itemList: itemList);
}
