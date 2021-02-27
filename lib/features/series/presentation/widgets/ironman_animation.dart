import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IronmanAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Lottie.asset('assets/15368-iron-man.json', fit: BoxFit.contain),
      ),
    );
  }
}
