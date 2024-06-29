import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shobdo_kutir/blocs/login/login_bloc.dart';
import 'package:shobdo_kutir/data/local/pref_helper.dart';
import 'package:shobdo_kutir/presentation/home/home_screen.dart';
import 'package:shobdo_kutir/presentation/login/login_screen.dart';
import 'package:shobdo_kutir/presentation/main/main_screen.dart';
import 'package:shobdo_kutir/presentation/play/play_screen.dart';
import 'package:shobdo_kutir/presentation/profile/profile_screen.dart';
import 'package:shobdo_kutir/presentation/register/register_screen.dart';
import 'package:shobdo_kutir/presentation/search2/search_screen.dart';
import 'package:shobdo_kutir/presentation/splash/splash_screen.dart';

import 'blocs/main/main_bloc.dart';
import 'blocs/play/play_bloc.dart';
import 'firebase_options.dart';
import 'presentation/chapter/chapter_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shobdo Kutir GITA',
      theme: ThemeData(
        fontFamily: "UniNeue",
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffe78b8b),
          primary: const Color(0xffF26B6C),
          onPrimary: Colors.white,
          primaryContainer: const Color(0xffeac7c7),
          onPrimaryContainer: const Color(0xffe34446),
        ),
        //  scaffoldBackgroundColor: Colors.white,
        textTheme: _textTheme,
      ),
      initialRoute: '/splash',
      routes: {
        '/main': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => MainBloc()),
              ],
              child: const MainScreen(),
            ),
        '/splash': (context) => const SplashScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginScreen(),
            ),
        '/home': (context) => const HomeScreen(),
        '/chapter': (context) => const ChapterScreen(),
        '/play': (context) => BlocProvider(
              create: (context) => PlayBloc(),
              child: const PlayScreen(),
            ),
        '/profile': (context) => const ProfileScreen(),
        '/search': (context) => SearchScreen(),
      },
      home: const SplashScreen(),
    );
  }
}

const _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: Colors.black),
  displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
  displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
  headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
  titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
  labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
  labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),
);
