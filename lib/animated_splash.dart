import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones/bloc/faqs_bloc/faqs_bloc.dart';
import 'package:oruphones/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:oruphones/presentation/home/screen/tabbutton.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> {
  @override
  void initState() {
    context.read<ProductBloc>().add(FetchProductsEvent());
    context.read<FaqsBloc>().add(FetchFAQSEvent());
    super.initState();
  }

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
