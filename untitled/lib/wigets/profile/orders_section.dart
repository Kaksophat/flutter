import 'package:flutter/material.dart';

class OrdersSection extends StatelessWidget {
  const OrdersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildOrderChip('To Pay'),
          const SizedBox(width: 7),
          _buildOrderChip(
            'To Receive',

            // iconUrl:
            // 'https://cdn.builder.io/api/v1/image/assets/TEMP/ec83e9990b12e2f1977657fc4f4e3101b8fd0ef3?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          ),
          const SizedBox(width: 7),
          _buildOrderChip('To Review'),
          const SizedBox(width: 7)
        ],
      ),
    );
  }

  Widget _buildOrderChip(String text, {String? iconUrl}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFE5EBFC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF0042E0),
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.16,
            ),
          ),
          if (iconUrl != null) ...[
            const SizedBox(width: 8),
            Image.network(
              iconUrl,
              width: 14,
              height: 14,
              fit: BoxFit.contain,
            ),
          ],
        ],
      ),
    );
  }
}
