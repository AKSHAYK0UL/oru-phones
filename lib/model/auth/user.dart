import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

//will be used as normal class and Hive adapter
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String mobileNumber;
  @HiveField(2)
  final bool isAccountExpired;
  @HiveField(3)
  final String createdDate;
  @HiveField(4)
  final List<String>? favListings;
  @HiveField(5)
  final bool waOptIn;
  @HiveField(6)
  String? cookie;
  //csrf token and userexist will not be saved in hive box
  String? csrfToken;
  bool? userExist; //when true your name screen will be skiped

  User({
    required this.userName,
    required this.mobileNumber,
    required this.isAccountExpired,
    required this.createdDate,
    required this.waOptIn,
    this.userExist,
    this.favListings,
    this.cookie,
    this.csrfToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json["userName"] ?? "",
      mobileNumber: json["mobileNumber"] ?? "",
      isAccountExpired: json["isAccountExpired"] ?? false,
      createdDate: json["createdDate"] ?? "",
      favListings: (json["favListings"] as List?)
              ?.where((item) => item.toString().isNotEmpty)
              .cast<String>()
              .toList() ??
          [],
      waOptIn: json["WAOptIn"] ?? true,
      csrfToken: json["csrfToken"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "userName": userName,
      "mobileNumber": mobileNumber,
      "isAccountExpired": isAccountExpired,
      "createdDate": createdDate,
      "WAOptIn": waOptIn,
      "csrfToken": csrfToken
    };

    if (favListings != null && favListings!.isNotEmpty) {
      data["favListings"] = favListings;
    }

    return data;
  }
}
