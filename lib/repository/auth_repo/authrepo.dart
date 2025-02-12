import 'dart:convert';

import 'package:oruphones/model/auth/createotp.dart';
import 'package:oruphones/model/auth/user.dart';
import 'package:oruphones/network/auth_network/authnetwork.dart';

class AuthRepo {
  final AuthNetwork _authNetwork;
  AuthRepo(this._authNetwork);

  // Create OTP
  Future<OTPResponse> createOtp(CreateOTP data) async {
    try {
      final jsonData = data.toJson();

      final response = await _authNetwork.createOtp(jsonData);
      if (response.statusCode == 200) {
        final otpResponseObject =
            OTPResponse.fromJson(jsonDecode(response.body));
        return otpResponseObject;
      } else {
        throw Exception("Failed to create OTP: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in createOtp: $e");
    }
  }

  //validate otp
  Future<User> validateOTP(OTPRequest data) async {
    try {
      final jsonData = data.toJson();
      final response = await _authNetwork.otpValidate(jsonData);
      if (response.statusCode == 200) {
        final cookie =
            response.headers["set-cookie"]?.split(";").first.substring(8);

        final decoded = jsonDecode(response.body);
        final userJson = decoded["user"];

        final userData = User.fromJson(userJson);
        userData.cookie = cookie ?? "";

        return userData;
      } else {
        throw Exception("Failed to validate OTP: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in OTP Validation: $e");
    }
  }
}
