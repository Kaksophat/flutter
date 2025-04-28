import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Addproduct.dart';

class Product {
  final String id;
  final String title;
  final String price;
  final String? imageUrl;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.imageUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? 'Unnamed Product',
      price: json['price']?.toString() ?? '0.00',
      imageUrl: json['image_url']?.toString(),
      status: json['status']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _productsFuture;
  String _token = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTokenAndFetchProducts();
  }

  Future<void> _deleteProduct(String id) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/product/$id');

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        _refreshProducts();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product deleted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _loadTokenAndFetchProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      setState(() {
        _token = token;
        _productsFuture = _fetchProducts();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _productsFuture = Future.error('Failed to load token: $e');
      });
    }
  }

  Future<List<Product>> _fetchProducts() async {
    if (_token.isEmpty) {
      throw Exception('Authentication required');
    }

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/product'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final productsJson = responseData['products'] as List? ?? [];

      return productsJson.map((item) => Product.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized - Please login again');
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _productsFuture = _fetchProducts();
    });
  }

  Widget _buildProductTable(List<Product> products) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Actions')),
        ],
        rows: products.map((product) {
          return DataRow(
            cells: [
              DataCell(
                product.imageUrl != null
                    ? Image.network(
                  product.imageUrl!,
                  width: 40,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error, size: 30),
                )
                    : Icon(Icons.image, size: 30),
              ),
              DataCell(
                SizedBox(
                  width: 60, // Fixed width for title column
                  child: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
              ),
              DataCell(Text('\$${product.price}')),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Add your edit functionality here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmationDialog(product.id);
                      },
                    ),
                  ],
                ),
              ),
              // DataCell(
              //   Row(
              //     children: [
              //       IconButton(
              //         icon: const Icon(Icons.edit, color: Colors.blue),
              //         onPressed: () {
              //           // Navigator.push(
              //           //   context,
              //           //   MaterialPageRoute(
              //           //     builder: (context) => UpdateBrand(brandId: brand.id),
              //           //   ),
              //           // ).then((_) => _refreshBrands());
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.delete, color: Colors.red),
              //         onPressed: () {
              //           // _showDeleteConfirmationDialog(brand.id);
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _showDeleteConfirmationDialog(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop();
              _deleteProduct(id);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
             Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AddProductScreen()),
             );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _refreshProducts,
        child: FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshProducts,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No products found'));
            } else {
              return _buildProductTable(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}