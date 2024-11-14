import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: Colors.grey.withOpacity(0.5),
            image: const DecorationImage(
              image: AssetImage("assets/profile.png"),
            ),
          ),
        ),
      ),
    );
  }
}
