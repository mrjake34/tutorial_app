import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.data, {super.key});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
