import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/AddBrand.dart';
import 'package:untitled/UpdateBrand.dart';
// import 'package:untitled/AddBrandScreen.dart';
// import 'package:untitled/updatebrand.dart';

class Brand {
  final String id;
  final String name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Brand({
    required this.id,
    required this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Unnamed Brand',
      status: json['status']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

class BrandsScreen extends StatefulWidget {
  @override
  _BrandsScreenState createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  late Future<List<Brand>> _brandsFuture;
  String _token = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTokenAndFetchBrands();
  }

  Future<void> _deleteBrand(String id) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/brand/$id');

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        _refreshBrands(); // Reload the list
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Brand deleted successfully')),
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

  Future<void> _loadTokenAndFetchBrands() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      setState(() {
        _token = token;
        _brandsFuture = _fetchBrands();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _brandsFuture = Future.error('Failed to load token: $e');
      });
    }
  }

  Future<List<Brand>> _fetchBrands() async {
    if (_token.isEmpty) {
      throw Exception('Authentication required');
    }

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/brand'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final brandsJson = responseData['brand'] as List? ?? [];

      return brandsJson.map((item) => Brand.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized - Please login again');
    } else {
      throw Exception('Failed to load brands: ${response.statusCode}');
    }
  }

  Future<void> _refreshBrands() async {
    setState(() {
      _brandsFuture = _fetchBrands();
    });
  }

  Widget _buildBrandList(List<Brand> brands) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 100,
        columns: const [
          DataColumn(
            label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
        rows: brands.map((brand) {
          return DataRow(
            cells: [
              DataCell(Text(brand.name)),
              DataCell(
                Text(
                  brand.status == "1" ? "Enable" : "Disable",
                  style: TextStyle(
                    color: brand.status == "1" ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateBrand(brandId: brand.id),
                          ),
                        ).then((_) => _refreshBrands());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmationDialog(brand.id);
                      },
                    ),
                  ],
                ),
              ),
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
        title: const Text('Delete Brand'),
        content: const Text('Are you sure you want to delete this brand?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _deleteBrand(id);         // Call delete API
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
        title: const Text('Brands'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBrand()),
              ).then((_) => _refreshBrands());
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _refreshBrands,
        child: FutureBuilder<List<Brand>>(
          future: _brandsFuture,
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
                      onPressed: _refreshBrands,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No brands found'));
            } else {
              return _buildBrandList(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}