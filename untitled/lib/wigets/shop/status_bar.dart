import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 16, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/64ac293cd0d911adb52872622f48942205c6cc58?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                width: 17,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/cc9e5ac6b98482b032d354934de92bf1b46426fa?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                width: 15,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/c30f4e9966eb5969816b16da18b6d684eac60a88?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                width: 24,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}