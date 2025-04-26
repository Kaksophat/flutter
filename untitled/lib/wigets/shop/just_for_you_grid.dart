import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JustForYouGrid extends StatelessWidget {
  const JustForYouGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildProductCard(
                imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/0a4d31b30e446ee515cde58982a1ae78cf4ef77a?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                price: '\$17,00',
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: _buildProductCard(
                imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/3bdc7576f025674c697eb2ca6a136631217b67a8?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                price: '\$17,00',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildProductCard(
                imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/7fcf2668474eaa730e72d6dd827300dde4493cff?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                price: '\$17,00',
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: _buildProductCard(
                imageUrl: 'https://cdn.builder.io/api/v1/image/assets/TEMP/ca05f72f4e3044cd17d3f71fdd7c94b5f2f51e55?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                price: '\$17,00',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String price,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.102),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Lorem ipsum dolor sit amet consectetur',
          style: GoogleFonts.nunitoSans(
            fontSize: 12,
            color: Colors.black,
            height: 1.33,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          price,
          style: GoogleFonts.raleway(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF202020),
            letterSpacing: -0.17,
          ),
        ),
      ],
    );
  }
}