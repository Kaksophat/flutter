import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Brands.dart';
import 'package:untitled/ListCategoryScreen.dart';

class UpdateBrand extends StatefulWidget {
  final String brandId;

  const UpdateBrand({Key? key, required this.brandId}) : super(key: key);

  @override
  _UpdateCategoryState createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateBrand> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedStatus = "1"; // Default "Enable"
  bool _isSubmitting = false;
  bool _isLoading = true;
  String _token = '';
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      setState(() {
        _token = token;
      });
      await _fetchCategoryData();
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load token: $e';
        _isLoading = false;
      });
      _showErrorSnackbar(_errorMessage);
    }
  }

  Future<void> _fetchCategoryData() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/brand/${widget.brandId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final category = data['brand'] ?? data; // Handle different response structures

        setState(() {
          _nameController.text = category['name'] ?? '';
          _selectedStatus = category['status']?.toString() ?? '1';
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load category data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching category: $e';
        _isLoading = false;
      });
      _showErrorSnackbar(_errorMessage);
    }
  }

  Future<void> _updateCategory() async {
    final String name = _nameController.text.trim();

    if (name.isEmpty) {
      _showErrorSnackbar('Please enter a name');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = '';
    });

    try {
      final response = await http.put(
        Uri.parse('http://10.0.2.2:8000/api/brand/${widget.brandId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: json.encode({
          'name': name,
          'status': _selectedStatus,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // _showSuccessSnackbar('Category updated successfully');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BrandsScreen()),
        );
      } else {
        throw Exception(responseData['message'] ?? 'Failed to update category');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
      _showErrorSnackbar(_errorMessage);
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Brand'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Brand Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                  value: "1",
                  child: Text('Enable'),
                ),
                DropdownMenuItem(
                  value: "0",
                  child: Text('Disable'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value!;
                });
              },
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _updateCategory,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isSubmitting
                    ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : Text('Update Brand'),
              ),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}