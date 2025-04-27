import 'package:flutter/material.dart';
import 'package:untitled/wigets/profile/activity_section.dart';
import 'package:untitled/wigets/profile/orders_section.dart';
import 'package:untitled/wigets/profile/search_tag.dart';
import 'package:untitled/wigets/profile/status_bar.dart';
import 'package:untitled/wigets/profile/stories_section.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StatusBar(),
                const ActivitySection(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    bottom: 12,
                  ),
                  child: Text(
                    'Hello, User!',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 1,
                      letterSpacing: -0.28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Search history',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.18,
                        ),
                      ),
                      const SizedBox(height: 26),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: const [
                          SearchTag(text: 'Red Dress'),
                          SearchTag(text: 'Sunglasses'),
                          SearchTag(text: 'Mustard Pants'),
                          SearchTag(text: '80-s Skirt'),
                        ],
                      ),
                    ],
                  ),
                ),

                // Recommendations Section
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 31),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recommendations',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.18,
                        ),
                      ),
                      const SizedBox(height: 26),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: const [
                          SearchTag(
                            text: 'Skirt',
                            backgroundColor: Color(0xFFF9F9F9),
                          ),
                          SearchTag(
                            text: 'Accessories',
                            backgroundColor: Color(0xFFF9F9F9),
                          ),
                          SearchTag(
                            text: 'Black T-Shirt',
                            backgroundColor: Color(0xFFF9F9F9),
                          ),
                          SearchTag(
                            text: 'Jeans',
                            backgroundColor: Color(0xFFF9F9F9),
                          ),
                          SearchTag(
                            text: 'White Shoes',
                            backgroundColor: Color(0xFFF9F9F9),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    left: 20,
                    bottom: 7,
                  ),
                  child: Text(
                    'Recently viewed',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 21,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 1,
                      letterSpacing: -0.21,
                    ),
                  ),
                ),
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/c6b9fd7b2d070aa846274a079ca949cbb1c1222a?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                  width: 355,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                    bottom: 12,
                  ),
                  child: Text(
                    'My Orders',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 21,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 1,
                      letterSpacing: -0.21,
                    ),
                  ),
                ),
                const OrdersSection(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28,
                    left: 20,
                    bottom: 5,
                  ),
                  child: Text(
                    'Stories',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 21,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 1,
                      letterSpacing: -0.21,
                    ),
                  ),
                ),
                const StoriesSection(),
                const SizedBox(height: 19),

              ],
            ),
          ),
        ),
      ),
    );
  }
}