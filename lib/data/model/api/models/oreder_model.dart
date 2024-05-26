class OrderModel {
  final List order_items;

  OrderModel({required this.order_items});

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(order_items: jsonData['order_items']);
  }
}
