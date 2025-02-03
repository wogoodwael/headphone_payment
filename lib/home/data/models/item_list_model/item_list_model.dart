import 'item.dart';

class ItemListModel {
  List<OrderItemModel>? items;

  ItemListModel({this.items});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
