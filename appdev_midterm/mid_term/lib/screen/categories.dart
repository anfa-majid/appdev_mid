import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/coming_soon.json",
              height: 200,
            ),

            SizedBox(height: 5),
            Text(
              "Categories Coming Soon",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10),
            Text(
              "We're working hard to bring you a great category browsing experience!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}