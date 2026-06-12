import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductRepository {
  static const String _baseUrl =
      'https://fakestoreapi.com/products';

  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data =
          jsonDecode(response.body);

      return data
          .map((json) => Product.fromJson(json))
          .toList();
    }

    throw Exception('Failed to load products');
  }
}