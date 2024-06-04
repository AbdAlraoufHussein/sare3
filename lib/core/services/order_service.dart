import 'package:wael/data/model/api/base_api_class.dart';
import 'package:wael/data/model/api/models/cart_model.dart';

abstract class OrderService extends BaseApi {
  static Future<void> postOrder({required List<CartModel> orderItems}) async {
    await BaseApi().postRequest(endPoint: 'orders',data: {
      'order_items': orderItems,
    });
  }
}
