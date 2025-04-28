import 'package:flutter/material.dart';
import 'package:untitled/AddCategoryScreen.dart';
import 'package:untitled/Brands.dart';
import 'package:untitled/ListCategoryScreen.dart';
import 'package:untitled/Product.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
              child: Text('Product'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BrandsScreen()),
                );
              },
              child: Text('Brands'),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to List Categories Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListCategoryScreen()),
                );
              },
              child: Text('Categories'),
            ),
          ],
        ),
      ),
    );
  }
}
