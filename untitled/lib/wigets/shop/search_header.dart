import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Shop',
            style: GoogleFonts.raleway(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF202020),
              letterSpacing: -0.28,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Text(
                  'Search',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFC7C7C7),
                    letterSpacing: -0.16,
                  ),
                ),
                const SizedBox(width: 100),
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/10e50150501f26cb83391a4b05a0f8e4e068e2f8?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                  width: 20,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}