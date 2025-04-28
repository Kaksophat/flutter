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
                'https://www.iconpacks.net/icons/2/free-settings-icon-3110-thumb.png',
                width: 17,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              Image.network(
                'https://www.iconpacks.net/icons/2/free-settings-icon-3110-thumb.png',
                width: 15,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 2),
              Image.network(
                'https://www.iconpacks.net/icons/2/free-settings-icon-3110-thumb.png',
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