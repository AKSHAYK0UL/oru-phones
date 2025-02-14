import 'package:http/http.dart' as http;
import 'package:oruphones/constants/constants.dart';

class FaqsNetwork {
  Future<http.Response> fetchFAQS() async {
    try {
      final uri = Uri.parse("$baseUrl/faq");
      final response = await http.get(uri, headers: contentTypeJson);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            "Error in fetch FAQ with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in fetch FAQ ${e.toString()}");
    }
  }
}
