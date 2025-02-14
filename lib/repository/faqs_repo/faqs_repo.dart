import 'dart:convert';

import 'package:oruphones/model/faq/faq.dart';
import 'package:oruphones/network/faqs_network/faqs_network.dart';

class FaqsRepo {
  final FaqsNetwork _faqsNetwork;
  FaqsRepo(this._faqsNetwork);

  Future<List<FAQ>> fetchFAQ() async {
    try {
      final response = await _faqsNetwork.fetchFAQS();
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<dynamic> rawData = jsonData["FAQs"];
        final faqs = rawData.map((fq) => FAQ.fromJson(fq)).toList();
        return faqs;
      } else {
        throw Exception(
            "Error in fetch FAQ with status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in fetch FAQ ${e.toString()}");
    }
  }
}
