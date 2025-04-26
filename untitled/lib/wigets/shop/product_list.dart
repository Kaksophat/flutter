import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/8283b84c90dfcc9e01dc341a643bcaf07f3be429?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/00b40beaa01424675a0e6867491a188f031c06fc?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/f1b427779cdb4bfddf2eb4941a8a03ba2cb733af?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/634b625b12bb658ee0959127964b9e18e694b92f?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/5af14039e7fd5f5238cd0607831a1186556883c6?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
            width: 60,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}