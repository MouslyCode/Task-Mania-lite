import 'package:flutter/material.dart';
import 'package:taskmania/page/main_page.dart';
import 'package:taskmania/theme.dart';

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 96),
              child: Image.asset(
                'assets/logo.png',
                width: 44,
              ),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 200,
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
                ])),
          ),
          Container(
            margin: const EdgeInsets.only(right: 32, left: 32, top: 16, bottom: 60),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
                color: blueFade, borderRadius: BorderRadius.circular(6)),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                  border: InputBorder.none, focusedBorder: InputBorder.none),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18, top: 16),
        child: SizedBox(
          width: 64,
          height: 64,
          child: ElevatedButton(
              onPressed: () {
                if (name.text.isNotEmpty) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage(name: name.text)),
                      (Route<dynamic> route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please Enter Your Name')));
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  shape: const CircleBorder(),
                  backgroundColor: bluePrimary),
              child: Image.asset(
                'assets/arrow_right.png',
                width: 30,
              )),
        ),
      ),
    );
  }
}
