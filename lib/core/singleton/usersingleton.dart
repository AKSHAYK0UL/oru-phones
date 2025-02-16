class UserSingleton {
  static UserSingleton? _instance;

  String userName;
  final String mobileNumber;
  final bool isAccountExpired;
  final String createdDate;
  final bool waOptIn;
  final String cookie;
  final String crsfToken;

  UserSingleton._internal({
    required this.userName,
    required this.mobileNumber,
    required this.isAccountExpired,
    required this.createdDate,
    required this.waOptIn,
    required this.cookie,
    required this.crsfToken,
  });

  factory UserSingleton({
    required String userName,
    required String mobileNumber,
    required bool isAccountExpired,
    required String createdDate,
    required bool waOptIn,
    required String cookie,
    required String crsfToken,
  }) {
    _instance ??= UserSingleton._internal(
      userName: userName,
      mobileNumber: mobileNumber,
      isAccountExpired: isAccountExpired,
      createdDate: createdDate,
      waOptIn: waOptIn,
      cookie: cookie,
      crsfToken: crsfToken,
    );
    return _instance!;
  }

  static UserSingleton? get user => _instance;

  static void clear() {
    _instance = null;
  }
}
