import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_product/pages/product_overview_pages.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Product",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 245, 229, 1),
      ),
      home: const ProductOverviewPage(),
    );
  }
}
