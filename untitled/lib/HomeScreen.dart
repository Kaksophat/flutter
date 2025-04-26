import 'package:flutter/material.dart';
import 'package:untitled/wigets/category_card.dart';
import 'package:untitled/wigets/custom_bottom_nav.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          const SizedBox(height: 13),
          Container(
            width: 350,
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF4E74F9),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Hello,\n',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'good Morning',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 41,
                      height: 41,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 46),
                Container(
                  padding: const EdgeInsets.fromLTRB(53, 15, 17, 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFDFE),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Search',
                        style: TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: 14,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(width: 100),
                      const Text(
                        'All',
                        style: TextStyle(
                          color: Color(0xFFB7B7B7),
                          fontSize: 14,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(width: 18),
                      Image.asset('https://cdn.builder.io/api/v1/image/assets/TEMP/61e57f7bb4893a514b91698d2370d76de94bd06f?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Explore categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xFF4D8AF0),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CategoryCard(
                      imagePath: 'https://cdn.builder.io/api/v1/image/assets/TEMP/421b06e9bf1d2ccefe7af483409e4413e8a07356?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                      title: 'Accounting',
                      coursesCount: '20 Courses',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      imagePath: 'https://cdn.builder.io/api/v1/image/assets/TEMP/f1af444cf1366c99d8e8ca4232fd2d102b257612?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                      title: 'Biology',
                      coursesCount: '15 Courses',
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CategoryCard(
                      imagePath: 'https://cdn.builder.io/api/v1/image/assets/TEMP/f6f9cb123471f022bf1ea39f42d8072b5a4d009e?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                      title: 'Photography',
                      coursesCount: '25 Courses',
                    ),
                    SizedBox(width: 15),
                    CategoryCard(
                      imagePath: 'https://cdn.builder.io/api/v1/image/assets/TEMP/e6e378abf63190fcf97c72afec5c717be63eaf71?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                      title: 'Marketing',
                      coursesCount: '18 Courses',
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 156,
                      height: 156,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            offset: const Offset(8, 4),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Center(
                        child: Image.asset(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/0b7f8f4b279d525cbdfcc7128f5675d3fb6ebbe8?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                          width: 134,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 156,
                      height: 156,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            offset: const Offset(8, 4),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Image.asset(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/5d075f961bf0cc351696973dc28151c707eea2af?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                          width: 88,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          const CustomBottomNav(),
        ],
      ),
    );
  }
}