import 'dart:convert';
import 'package:oruphones/model/product/product.dart';
import 'package:oruphones/network/product_network/productnetwork.dart';

class ProductRepo {
  final ProductNetwork _productNetwork;
  ProductRepo(this._productNetwork);

  Future<Product> fetchProducts() async {
    try {
      final response = await _productNetwork.fetchProducts();
      if (response.statusCode == 200) {
        print("RESPONSE : ${response.body}");
        final jsonData = jsonDecode(response.body);
        Map<String, dynamic> outerData = jsonData["data"];
        List<dynamic> rawList = outerData["data"];

        final List<Listing> listing =
            rawList.map((p) => Listing.fromJson(p)).toList();

        return Product(data: listing);
      } else {
        throw Exception(
            'Failed to Fetch products Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
