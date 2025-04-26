import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Items',
                style: GoogleFonts.raleway(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF202020),
                  letterSpacing: -0.21,
                ),
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/TEMP/4dc0a815e4fbcb6f3d9d7a461052c89ab14450af?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 6),
              Text(
                'Lorem ipsum dolor sit amet consectetur.',
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  color: Colors.black,
                  height: 1.33,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '\$17,00',
                style: GoogleFonts.raleway(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF202020),
                  letterSpacing: -0.17,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'See All',
                    style: GoogleFonts.raleway(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/81302366c25c4d224ffb1068039ea1792b7ed95d?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/c58c01b64820334f37cf7a7f924f7127d5f4f0aa?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur.',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            color: Colors.black,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '\$32,00',
                          style: GoogleFonts.raleway(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF202020),
                            letterSpacing: -0.17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/c999c15db0d3a2e60bd003c97c237b92f5b8ba1f?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur.',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            color: Colors.black,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '\$21,00',
                          style: GoogleFonts.raleway(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF202020),
                            letterSpacing: -0.17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}