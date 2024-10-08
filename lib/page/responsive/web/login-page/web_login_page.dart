import 'package:flutter/material.dart';
import 'package:taskmania/page/main_page.dart';
import 'package:taskmania/theme.dart';

class WebLoginPage extends StatelessWidget {
  const WebLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          width: 712,
          height: 570,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 120),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 44,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: RichText(
                  text: TextSpan(
                    text: "What's Your ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: blackColor),
                    children: [
                      TextSpan(
                          text: 'Name ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: bluePrimary)),
                      const TextSpan(
                        text: '?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 32, left: 32, top: 16, bottom: 68),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                    color: blueFade, borderRadius: BorderRadius.circular(6)),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 64,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {
                      if (name.text.isNotEmpty) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MainPage(name: name.text)),
                            (Route<dynamic> route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please Enter Your Name')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        shape: const CircleBorder(),
                        backgroundColor: bluePrimary),
                    child: Image.asset(
                      'assets/arrow_right.png',
                      width: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
