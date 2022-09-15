import 'package:get/get.dart';
import 'package:getx_product/models/card_item.dart';
import 'package:getx_product/models/order.dart';

class OrderController extends GetxController {
  List<Order> _order = [];
  List<Order> get orders {
    return [...orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _order.insert(
        0,
        Order(
            orderId: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now()));
    update();
  }
}
