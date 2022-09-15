import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_product/controller/order_controller.dart';
import 'package:getx_product/widgets/app_drawer.dart';
import 'package:getx_product/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());

  OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yours Orders"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) =>
              OrderItem(orderController.orders[index])),
    );
  }
}
