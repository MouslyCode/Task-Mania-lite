import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmania/page/login_page.dart';
import 'package:taskmania/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (Route<dynamic> route) => false,
      ),
    );
    super.initState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              scale: 4,
            ),
          )
        ],
      ),
    );
  }
}
