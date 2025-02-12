//Sending User Data to Generate OTP
class CreateOTP {
  final String countryCode;
  final String mobileNumber;

  CreateOTP({required this.countryCode, required this.mobileNumber});

  factory CreateOTP.fromJson(Map<String, dynamic> json) {
    return CreateOTP(
      countryCode: json["countryCode"],
      mobileNumber: json["mobileNumber"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "countryCode": int.parse(countryCode),
      "mobileNumber": int.parse(mobileNumber),
    };
  }
}

class OTPData {
  final String mobileNumber;

  OTPData({required this.mobileNumber});

  factory OTPData.fromJson(Map<String, dynamic> json) {
    return OTPData(
      mobileNumber: json['mobileNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
    };
  }
}

//OTP Response
class OTPResponse {
  final String reason;
  final String status;
  final OTPData dataObject;

  OTPResponse({
    required this.reason,
    required this.status,
    required this.dataObject,
  });

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      reason: json['reason'] as String,
      status: json['status'] as String,
      dataObject: OTPData.fromJson(json['dataObject'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'status': status,
      'dataObject': dataObject.toJson(),
    };
  }
}

// Verify otp
class OTPRequest {
  final String countryCode;
  final String mobileNumber;
  final String otp;

  OTPRequest(
      {required this.countryCode,
      required this.mobileNumber,
      required this.otp});

  factory OTPRequest.fromJson(Map<String, dynamic> json) {
    return OTPRequest(
      countryCode: json["countryCode"],
      mobileNumber: json["mobileNumber"],
      otp: json["otp"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "countryCode": int.parse(countryCode),
      "mobileNumber": int.parse(mobileNumber),
      "otp": int.parse(otp),
    };
  }
}
