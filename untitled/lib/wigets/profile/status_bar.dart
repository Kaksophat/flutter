import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          // Row(
          //   children: [
          //     Image.network('https://cdn.builder.io/api/v1/image/assets/TEMP/7c8d47947343c81f716ecd876ae11582e437f696?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 17, height: 10),
          //     const SizedBox(width: 5),
          //     Image.network('https://cdn.builder.io/api/v1/image/assets/TEMP/b13bb4f891aabcc1ea82fb55a139473d7bea961a?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 15, height: 11),
          //     const SizedBox(width: 5),
          //     Image.network('https://cdn.builder.io/api/v1/image/assets/TEMP/13ea1b214bdf8de5180e028fafb0a5a31f192148?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 24, height: 12),
          //   ],
          // ),
        ],
      ),
    );
  }
}