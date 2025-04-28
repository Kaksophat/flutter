import 'package:flutter/material.dart';

class SearchTag extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const SearchTag({
    Key? key,
    required this.text,
    this.backgroundColor = const Color(0xFFF4F4F4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          letterSpacing: -0.17,
        ),
      ),
    );
  }
}