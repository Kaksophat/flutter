import 'package:flutter/material.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _buildLiveStory(),
          const SizedBox(width: 6),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/773d38a901d01af27ad99c93f2642ffeee560fc8?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 104,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/ab9d32c8d832fc3c57748f7207ce0481ba82066d?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 104,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/0709b59c5249543c85032bbec986677c66bb5145?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 25,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildLiveStory() {
    return Stack(
      children: [
        Image.network(
          'https://cdn.builder.io/api/v1/image/assets/TEMP/e01e687f939dba75d61b6d790f47906e68cd2da7?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          width: 104,
          height: 175,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 4,
          left: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF08C514),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Live',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}