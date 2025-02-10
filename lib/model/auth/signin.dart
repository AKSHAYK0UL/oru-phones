class Signin {
  final String countryCode;
  final String mobileNumber;

  Signin({required this.countryCode, required this.mobileNumber});

  factory Signin.fromJson(Map<String, dynamic> json) {
    return Signin(
        countryCode: json["countryCode"], mobileNumber: json["mobileNumber"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "countryCode": countryCode,
      "mobileNumber": mobileNumber,
    };
  }
}
