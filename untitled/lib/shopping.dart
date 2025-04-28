import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/wigets/profile/status_bar.dart';
import 'package:untitled/wigets/shop/just_for_you_grid.dart';
import 'package:untitled/wigets/shop/product_grid.dart';
import 'package:untitled/wigets/shop/product_list.dart';
import 'package:untitled/wigets/shop/product_phone.dart';
import 'package:untitled/wigets/shop/sale_banner.dart';
import 'package:untitled/wigets/shop/search_header.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  Widget _buildNetworkImage(String url, {double? width, BoxFit? fit}) {
    return Image.network(
      url,
      width: width,
      fit: fit ?? BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: width,
          color: Colors.grey[200],
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          color: Colors.grey[200],
          child: const Icon(Icons.broken_image, color: Colors.grey),
        );
      },
    );
  }

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
                      // const SaleBanner(),
                      // const SizedBox(height: 39),
                      // _buildNetworkImage(
                      //   'https://cdn.builder.io/api/v1/image/assets/TEMP/70449a7c28ba04cbe9aabde04b0b5153ada1f3d5',
                      //   width: double.infinity,
                      //   fit: BoxFit.contain,
                      // ),
                      // const SizedBox(height: 27),
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
                      // const ProductGrid(),
                      const SizedBox(height: 24),

                      Text(
                        'flash sale',
                        style: GoogleFonts.raleway(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF202020),
                          letterSpacing: -0.21,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Product_phone(),
                      const SizedBox(height: 40),
                      // const ProductGrid(),
                      const SizedBox(height: 24),
                      // _buildNetworkImage(
                      //   'https://cdn.builder.io/api/v1/image/assets/TEMP/1e64f5e48e87717d3ce8893df2fc41345ccfc20e',
                      //   width: double.infinity,
                      //   fit: BoxFit.contain,
                      // ),
                      const SizedBox(height: 24),

                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // child: Row(
                        //   children: [
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(9),
                        //       child: _buildNetworkImage(
                        //         'https://cdn.builder.io/api/v1/image/assets/TEMP/ae4975840507de44ebc2a073f1b97d842a2b35af',
                        //         width: 104,
                        //       ),
                        //     ),
                        //     const SizedBox(width: 6),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(9),
                        //       child: _buildNetworkImage(
                        //         'https://cdn.builder.io/api/v1/image/assets/TEMP/5f5d9488368ccbf234b5b200e89ffc53ff32d0ba',
                        //         width: 104,
                        //       ),
                        //     ),
                        //     const SizedBox(width: 6),
                        //     ClipRRect(
                        //       borderRadius: BorderRadius.circular(9),
                        //       child: _buildNetworkImage(
                        //         'https://cdn.builder.io/api/v1/image/assets/TEMP/62645b7707392147a5709ab7f93c5f836e013692',
                        //         width: 104,
                        //       ),
                        //     ),
                        //     const SizedBox(width: 6),
                        //     Container(
                        //       padding: const EdgeInsets.symmetric(
                        //         vertical: 6,
                        //         horizontal: 5,
                        //       ),
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(9),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.102),
                        //             blurRadius: 10,
                        //             offset: const Offset(0, 5),
                        //           ),
                        //         ],
                        //       ),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           _buildNetworkImage(
                        //             'https://cdn.builder.io/api/v1/image/assets/TEMP/f844ee57027b32a7a8882be6d7ca848c7c7ce5b2',
                        //             width: 20,
                        //           ),
                        //           const SizedBox(height: 7),
                        //           Text(
                        //             '1780',
                        //             style: GoogleFonts.raleway(
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w700,
                        //               color: const Color(0xFF000000),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                      const SizedBox(height: 27),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Just For You',
                      //       style: GoogleFonts.raleway(
                      //         fontSize: 21,
                      //         fontWeight: FontWeight.w700,
                      //         color: const Color(0xFF202020),
                      //         letterSpacing: -0.21,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      // const JustForYouGrid(),
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