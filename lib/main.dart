import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oruphones/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:oruphones/constants/constants.dart';
import 'package:oruphones/core/route/route.dart';
import 'package:oruphones/core/theme/apptheme.dart';
import 'package:oruphones/helper/hive.dart';
import 'package:oruphones/model/auth/user.dart';
import 'package:oruphones/network/auth_network/authnetwork.dart';
import 'package:oruphones/presentation/auth/screen/signin.dart';
import 'package:oruphones/repository/auth_repo/authrepo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>(hiveBoxUserData);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(AuthNetwork()),
        ),
        RepositoryProvider(
          create: (context) => HiveService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              context.read<AuthRepo>(),
              context.read<HiveService>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ORU PHONES',
          theme: appThemeData(screenWidth, screenHeight),
          home: const SignIn(),
          routes: routes(context),
        ),
      ),
    );
  }
}
