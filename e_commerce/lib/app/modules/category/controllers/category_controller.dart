import 'dart:convert';

import 'package:e_commerce/app/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  Future<List<ProductModel>> fetchedProduct() async {
    String url = "https://backend-test.bazar365.com/api/productGroup/products";

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((product) => ProductModel.fromJson(product)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void increaseQuantity(ProductModel product) {
    product.proQuantity++;
    update();
  }

  void decreaseQuantity(ProductModel product) {
    if (product.proQuantity > 1) {
      product.proQuantity--;
      update();
    }
  }

  void isButtonClicked(ProductModel product) {
    product.isBtnClicked = true;
    Future.delayed(const Duration(seconds: 5), () {
      product.isBtnClicked = false;
      update();
    });
    update();
  }
}
