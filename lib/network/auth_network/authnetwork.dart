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
  Future<http.Response> isLoggedIn(String cookie) async {
    try {
      final uri = Uri.parse("$baseUrl/isLoggedIn");
      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Cookie": cookie,
        },
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            "Failed to get loggedin status. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in loggedin: $e");
    }
  }

  //update username
  Future<http.Response> updateUserName(
      String cookie, String csrfToken, String userName) async {
    try {
      final uri = Uri.parse("$baseUrl/update");
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Cookie": cookie,
          "X-Csrf-Token": csrfToken,
        },
        body: jsonEncode(
          {"countryCode": 91, "userName": userName},
        ),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
            "Error is Updating name. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error is Updating name: ${e.toString()}");
    }
  }

  //logout
  Future<http.Response> logOut(
    String cookie,
    String csrfToken,
  ) async {
    print("COOKIE $cookie");
    print("TOKEN $csrfToken");
    try {
      final uri = Uri.parse("$baseUrl/logout");
      final response = await http.get(uri, headers: {
        "Content-Type": "application/json",
        "Cookie": cookie,
        "X-Csrf-Token": csrfToken,
      });
      if (response.statusCode == 200) {
        return response;
      } else {
        print("Error is SignOut. Status code: ${response.statusCode}");
        throw Exception(
            "Error is SignOut. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error is SignOut: ${e.toString()}");
      throw Exception("Error is SignOut: ${e.toString()}");
    }
  }
}
