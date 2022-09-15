import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_product/controller/cart_controller.dart';
import 'package:getx_product/controller/product_controller.dart';
import 'package:getx_product/pages/cart_screen.dart';
import 'package:getx_product/widgets/app_drawer.dart';
import 'package:getx_product/widgets/badge.dart';
import 'package:getx_product/widgets/productgrid.dart';

enum FilterOptions {
  FAVOURITES,
  ALL,
}

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _showOnlyFavourites = false;
    final controller = Get.put(ProductController());
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: <Widget>[
          GetBuilder<ProductController>(
              init: ProductController(),
              builder: (context) {
                return PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (FilterOptions selectedValue) {
                      if (selectedValue == FilterOptions.FAVOURITES) {
                        _showOnlyFavourites = true;
                        print(_showOnlyFavourites);
                      } else {
                        _showOnlyFavourites = false;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                          const PopupMenuItem(
                            value: FilterOptions.FAVOURITES,
                            child: Text("Only Favourites"),
                          ),
                          const PopupMenuItem(
                            value: FilterOptions.ALL,
                            child: Text("Show All"),
                          )
                        ]);
              }),
          GetBuilder<CartController>(
              init: CartController(),
              builder: (contex) {
                return Badge(
                  value: cartController.itemCount.toString(),
                  color: Theme.of(context).colorScheme.secondary,
                  child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                        Get.to(() => const CartScreen());
                      }),
                );
              })
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
