import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/AddCategoryScreen.dart';
import 'package:untitled/updatecategory.dart';

// Updated Category Model
class Category {
  final String id;
  final String name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  // final List<dynamic> brands;

  Category({
    required this.id,
    required this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Unnamed Category',
      status: json['status']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

class ListCategoryScreen extends StatefulWidget {
  @override
  _ListCategoryScreenState createState() => _ListCategoryScreenState();
}

class _ListCategoryScreenState extends State<ListCategoryScreen> {
  late Future<List<Category>> _categoriesFuture;
  String _token = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTokenAndFetchCategories();
  }

  Future<void> _deleteCategory(String id) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/category/$id'); // your delete API URL

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        // Successfully deleted

        _refreshCategories(); // Reload the list
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


  Future<void> _loadTokenAndFetchCategories() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      setState(() {
        _token = token;
        _categoriesFuture = _fetchCategories();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _categoriesFuture = Future.error('Failed to load token: $e');
      });
    }
  }

  Future<List<Category>> _fetchCategories() async {
    if (_token.isEmpty) {
      throw Exception('Authentication required');
    }

    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/category'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final categoriesJson = responseData['category'] as List? ?? [];

      return categoriesJson.map((item) => Category.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized - Please login again');
    } else {
      throw Exception('Failed to load categories: ${response.statusCode}');
    }
  }

  Future<void> _refreshCategories() async {
    setState(() {
      _categoriesFuture = _fetchCategories();
    });
  }

  Widget _buildCategoryList(List<Category> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 100,

        columns: const [
          DataColumn(
            label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          DataColumn(
            label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          DataColumn(
            label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
        rows: categories.map((category) {
          return DataRow(
            cells: [
              DataCell(Text(category.name)),
              DataCell(
                Text(
                  category.status == "1" ? "Enable" : "Disable",
                  style: TextStyle(
                    color: category.status == "1" ? Colors.green : Colors.red,
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
                       Navigator.pushReplacement(context,
                       MaterialPageRoute(builder: (context) => UpdateCategory(categoryId: category.id)),
                       );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmationDialog(category.id);
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
        title: const Text('Delete Category'),
        content: const Text('Are you sure you want to delete this category?'),
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
              _deleteCategory(id);         // Call delete API
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

        title: const Text('Categories'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCategoryScreen()),
              ).then((value) {
                _refreshCategories(); // refresh after adding
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _refreshCategories,
        child: FutureBuilder<List<Category>>(
          future: _categoriesFuture,
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
                      onPressed: _refreshCategories,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No categories found'));
            } else {
              return _buildCategoryList(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
