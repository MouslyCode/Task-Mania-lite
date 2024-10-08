// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:taskmania/page/responsive/mobile/login-page/mobile_login_page.dart';
import 'package:taskmania/page/responsive/web/login-page/web_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 750) {
          return const MobileLoginPage();
        } else {
          return const WebLoginPage();
        }
      },
    );
  }
}
