import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/wigets/profile/status_bar.dart';
import 'package:untitled/wigets/shop/just_for_you_grid.dart';
import 'package:untitled/wigets/shop/product_grid.dart';
import 'package:untitled/wigets/shop/product_list.dart';
import 'package:untitled/wigets/shop/sale_banner.dart';
import 'package:untitled/wigets/shop/search_header.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StatusBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchHeader(),
                      const SizedBox(height: 17),
                      const SaleBanner(),
                      const SizedBox(height: 39),
                      Image.network(
                        'https://cdn.builder.io/api/v1/image/assets/TEMP/70449a7c28ba04cbe9aabde04b0b5153ada1f3d5?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 27),
                      Text(
                        'Top Products',
                        style: GoogleFonts.raleway(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF202020),
                          letterSpacing: -0.21,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ProductList(),
                      const SizedBox(height: 40),
                      const ProductGrid(),
                      const SizedBox(height: 24),
                      Image.network(
                        'https://cdn.builder.io/api/v1/image/assets/TEMP/1e64f5e48e87717d3ce8893df2fc41345ccfc20e?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Popular',
                            style: GoogleFonts.raleway(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF202020),
                              letterSpacing: -0.21,
                            ),
                          ),
                          Row(
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
                        ],
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Image.network(
                                'https://cdn.builder.io/api/v1/image/assets/TEMP/ae4975840507de44ebc2a073f1b97d842a2b35af?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                                width: 104,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Image.network(
                                'https://cdn.builder.io/api/v1/image/assets/TEMP/5f5d9488368ccbf234b5b200e89ffc53ff32d0ba?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                                width: 104,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(9),
                              child: Image.network(
                                'https://cdn.builder.io/api/v1/image/assets/TEMP/62645b7707392147a5709ab7f93c5f836e013692?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                                width: 104,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 5,
                              ),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    'https://cdn.builder.io/api/v1/image/assets/TEMP/f844ee57027b32a7a8882be6d7ca848c7c7ce5b2?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                                    width: 20,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    '1780',
                                    style: GoogleFonts.raleway(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 27),
                      Row(
                        children: [
                          Text(
                            'Just For You',
                            style: GoogleFonts.raleway(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF202020),
                              letterSpacing: -0.21,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Image.network(
                            'https://cdn.builder.io/api/v1/image/assets/TEMP/2ba839db766b16aa5802dacac6b76759c4902ac4?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                            width: 14,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const JustForYouGrid(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}