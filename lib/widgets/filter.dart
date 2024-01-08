import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  Filter({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: Text(text)),
    );
  }
}
