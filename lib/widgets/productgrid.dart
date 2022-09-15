import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_product/controller/product_controller.dart';
import 'package:getx_product/controller/cart_controller.dart';
import 'package:getx_product/pages/product_details_screen.dart';

class ProductsGrid extends StatelessWidget {
  ProductsGrid(bool showOnlyFavourites, {Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    controller.items[index].isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).backgroundColor,
                  ),
                  onPressed: () {
                    controller.toggleFavouriteStatus(index);
                  },
                ),
                title: Text(
                  controller.items[index].productTitle,
                  textAlign: TextAlign.center,
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addItem(
                              controller.items[index].id,
                              controller.items[index].price,
                              controller.items[index].productTitle,
                              1);
                        },
                        color: Theme.of(context).accentColor,
                      );
                    }),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    ProductDetailsScreen(
                      controller.items[index].productTitle,
                      controller.items[index].price,
                      controller.items[index].imageUrl,
                      controller.items[index].description,
                    ),
                  );
                },
                child: Image.network(
                  controller.items[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
