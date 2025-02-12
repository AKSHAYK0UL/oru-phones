import 'package:flutter/widgets.dart';
import 'package:oruphones/presentation/auth/screen/otp.dart';
import 'package:oruphones/presentation/auth/screen/username.dart';
import 'package:oruphones/presentation/home/screen/home.dart';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    VerifyOtp.routeName: (context) => VerifyOtp(),
    UserName.routeName: (context) => const UserName(),
    Home.routeName: (context) => const Home(),
  };
}
