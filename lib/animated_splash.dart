import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones/presentation/home/screen/tabbutton.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:
          Lottie.asset("assets/Splash.json", repeat: true, fit: BoxFit.contain),
      splashIconSize: MediaQuery.sizeOf(context).height * 0.8,
      duration: 5500,
      nextScreen: const Tabbutton(),
    );
  }
}
