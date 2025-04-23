import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:boo/models/product_model.dart';

class ProductRepo {
  fetchProducts() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final productsList = jsonDecode(response.body);

      return productsList
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    }
    
    else{
    throw Exception('Failed to load products');}
  }
}
