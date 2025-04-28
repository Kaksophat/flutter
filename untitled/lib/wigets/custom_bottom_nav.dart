import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(204, 204, 204, 0.15),
            offset: Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF4D8AF0).withOpacity(0.28),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/e7e302931ace223a8fa0d496460a3b178ab14cdc?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Home',
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
              const SizedBox(width: 47),
              Image.asset('https://cdn.builder.io/api/v1/image/assets/TEMP/0dfe8911ffb8e376b18385200b4a450e3c256cc0?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 24, height: 24),
              const SizedBox(width: 47),
              Image.asset('https://cdn.builder.io/api/v1/image/assets/TEMP/5ca421279ffdc48c014db8b72c423f1bb3067bf5?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 24, height: 24),
              const SizedBox(width: 47),
              Image.asset('https://cdn.builder.io/api/v1/image/assets/TEMP/6c1dc1201550cfc664c67411ea4e6bf6614375d9?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39', width: 24, height: 24),
            ],
          ),
          const SizedBox(height: 29),
          Container(
            width: 134,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFF161C2B),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}