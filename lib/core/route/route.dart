import 'package:flutter/widgets.dart';
import 'package:oruphones/presentation/auth/screen/otp.dart';
import 'package:oruphones/presentation/auth/screen/signin.dart';
import 'package:oruphones/presentation/auth/screen/username.dart';
import 'package:oruphones/presentation/home/screen/home.dart';
import 'package:oruphones/presentation/home/screen/tabbutton.dart';

Map<String, WidgetBuilder> routes(BuildContext context) {
  return {
    SignIn.routeName: (context) => const SignIn(),
    VerifyOtp.routeName: (context) => const VerifyOtp(),
    UserName.routeName: (context) => const UserName(),
    Home.routeName: (context) => const Home(),
    Tabbutton.routeName: (context) => const Tabbutton(),
  };
}
