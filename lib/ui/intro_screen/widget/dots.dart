import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class Dots extends StatelessWidget {
  final bool active;
  const Dots({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      duration: Duration(milliseconds: 250),
      width: active ? 16 : 8,
      height: 10,
      decoration: BoxDecoration(
        color: active ? ColorsManager.goldColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
