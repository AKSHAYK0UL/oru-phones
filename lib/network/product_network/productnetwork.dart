import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oruphones/constants/constants.dart';

class ProductNetwork {
  Future<http.Response> fetchProducts() async {
    try {
      final uri = Uri.parse("$baseUrl/filter");
      final response = await http.post(
        uri,
        headers: contentTypeJson,
        body: jsonEncode({
          "filter": {
            "condition": [],
            "make": [],
            "storage": [],
            "ram": [],
            "warranty": [],
            "priceRange": [],
            "verified": true,
            "sort": {},
            "page": 1
          }
        }),
      );
      if (response.statusCode == 200) {
        return response;
      }
      throw Exception(
          "Error in Fetching Products Status code: ${response.statusCode}");
    } catch (e) {
      throw Exception("Error in Fetching Products: ${e.toString()}");
    }
  }
}
