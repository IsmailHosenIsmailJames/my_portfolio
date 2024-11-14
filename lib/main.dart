import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/src/screens/home/home.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      defaultTransition: Transition.fade,
      home: HomePage(),
    );
  }
}
