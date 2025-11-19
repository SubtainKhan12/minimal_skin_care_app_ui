import 'package:flutter/material.dart';
import 'package:skin_care/main.dart';
import 'package:skin_care/utils/utils.dart';

import '../const/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/4.png'),
            CustomText(text: "Shop the best", fontSize: 29, color: Colors.white, fontWeight: FontWeight.w800),
            SizedBox(height: 10),
            CustomText(text: "Skin \nProducts", fontSize: 70, color: Colors.white, fontWeight: FontWeight.w400),
            SizedBox(height: 20),
            InkWell(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(right: 24),
                child: Center(
                  child: CustomText1(
                    text: "Get Started",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF434127),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
