import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kazeem_portfolio/pages/email_signIn.dart';
import 'package:kazeem_portfolio/pages/main_page.dart';
import 'package:kazeem_portfolio/pages/splash_screen.dart';
import 'package:kazeem_portfolio/widgets/snackbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, Widget? widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: AnimatedSplash(),
          );
        });
  }
}

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({super.key});

  final String route = '/AnimatedSplash';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: const Splash(),
      // ignore: always_specify_types
      nextScreen: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
          // print(snapshot.data);
          if (snapshot.hasData) {
            MyHomePage();
          } else {
            return EmailSignIn();
          }
          return EmailSignIn();
        },
      ),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      duration: 2000,
    );
  }
}
