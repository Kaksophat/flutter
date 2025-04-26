import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage('https://cdn.builder.io/api/v1/image/assets/TEMP/41450b574406198f17a94d2c880626dcea127cd3?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/039678b161b0c9d13dc58cca025a689696c3bf87?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 12, 67, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Big Sale',
                  style: GoogleFonts.raleway(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.29,
                  ),
                ),
                Text(
                  'Up to 50%',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 29),
                Text(
                  'Happening\nNow',
                  style: GoogleFonts.raleway(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.11,
                    height: 1.36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}