import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oruphones/constants/constants.dart';

class AuthNetwork {
  //create otp
  Future<http.Response> createOtp(Map<String, dynamic> jsonData) async {
    try {
      final uri = Uri.parse("$baseUrl/login/otpCreate");

      final response = await http.post(
        uri,
        headers: contentTypeJson,
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            "Failed to create OTP. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in createOtp: $e");
    }
  }

  //validate otp
  Future<http.Response> otpValidate(Map<String, dynamic> jsonData) async {
    try {
      final uri = Uri.parse("$baseUrl/login/otpValidate");
      final response = await http.post(
        uri,
        headers: contentTypeJson,
        body: jsonEncode(jsonData),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            "Failed to validate OTP. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in OTP Validation: $e");
    }
  }
  //isloggedIn
  //logout
  //update username
}
