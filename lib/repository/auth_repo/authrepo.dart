import 'dart:convert';

import 'package:oruphones/core/singleton/usersingleton.dart';
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
        final cookie = response.headers["set-cookie"]?.split(";")[0];

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

  //isloggedin
  Future<User> isLoggedIn(String cookie) async {
    try {
      final response = await _authNetwork.isLoggedIn(cookie);

      if (response.statusCode == 200) {
        final cookie = response.headers["set-cookie"]?.split(";")[0];

        final decoded = jsonDecode(response.body);

        final Map<String, dynamic> userJson = decoded["user"];
        final userData = User.fromJson(userJson);

        userData.csrfToken = decoded["csrfToken"] ?? "";

        userData.cookie = cookie ?? "";
        userData.userExist = userData.userName.isEmpty ? false : true;
        return userData;
      } else {
        throw Exception("Failed to get login status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error in loggedIn: $e");
    }
  }

//update username for new user
  Future<int> updateUserName(String userName) async {
    try {
      final currentUser = UserSingleton.user;

      final response = await _authNetwork.updateUserName(
          currentUser!.cookie, currentUser.crsfToken, userName);
      if (response.statusCode == 200) {
        return 200; //ok -> updated successfully
      } else {
        throw Exception(
            "Error is Updating name. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error is Updating name: ${e.toString()}");
    }
  }

  //signout
  Future<int> logOut() async {
    try {
      final currentUser = UserSingleton.user;

      final response =
          await _authNetwork.logOut(currentUser!.cookie, currentUser.crsfToken);
      if (response.statusCode == 200) {
        return 200; //ok logout successfully
      } else {
        throw Exception(
            "Error is SignOut. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error is SignOut: ${e.toString()}");
    }
  }
}
