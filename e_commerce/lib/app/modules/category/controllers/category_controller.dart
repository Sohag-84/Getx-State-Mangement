import 'dart:convert';

import 'package:e_commerce/app/model/product_model.dart';
import 'package:e_commerce/config/app_config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  Future<List<ProductModel>> fetchedProduct() async {
    String url = "${AppConfig.baseURL}productGroup/products";

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
}
