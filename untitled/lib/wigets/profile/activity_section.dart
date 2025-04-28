import 'package:flutter/material.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/de6a5a80314940401f75a19646b88bf168d86a00?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF004CFF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'My Activity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: -0.16,
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Image.network(
          //       'https://cdn.builder.io/api/v1/image/assets/TEMP/2edd316c942df6efb5a65a303ba9e43f8eeefa73?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          //       width: 35,
          //       height: 35,
          //       fit: BoxFit.contain,
          //     ),
          //     const SizedBox(width: 10),
          //     Image.network(
          //       'https://cdn.builder.io/api/v1/image/assets/TEMP/598b78da1d2d75c56a20cea49e9d855ceb57bb3d?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          //       width: 35,
          //       height: 35,
          //       fit: BoxFit.contain,
          //     ),
          //     const SizedBox(width: 10),
          //     Image.network(
          //       'https://cdn.builder.io/api/v1/image/assets/TEMP/f7abc6a3743c233fbe612fd8d8f9a127c51e6aa6?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          //       width: 35,
          //       height: 35,
          //       fit: BoxFit.contain,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}