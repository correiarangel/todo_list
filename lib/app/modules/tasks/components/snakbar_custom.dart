import 'package:flutter/material.dart';

class SnakBarCustom extends SnackBar {
  final Color color;
  const SnakBarCustom( {
    Key? key,
    required this.color,
    required super.content,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SnackBar(
      
      duration: const Duration(seconds: 5),
      content: content,
      backgroundColor: color,
    );
  }
}
