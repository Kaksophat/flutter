import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/AdminDashboard.dart';
import 'package:untitled/HomeScreen.dart';
import 'package:untitled/Login.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = '';
  String email = '';
  String role = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Guest';
      email = prefs.getString('email') ?? 'guest@example.com';
      role = prefs.getString('role') ?? 'user';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserProfile(),
            _buildAccountOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://example.com/profile.jpg'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                email,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountOptions(BuildContext context) {
    return Column(
      children: [
        _buildOptionTile(
          icon: Icons.shopping_bag,
          title: 'My Order',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          ),
        ),
        _buildOptionTile(
          icon: Icons.favorite,
          title: 'Favorites',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          ),
        ),
        _buildOptionTile(
          icon: Icons.location_on,
          title: 'Saved Addresses',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          ),
        ),
        _buildOptionTile(
          icon: Icons.payment,
          title: 'Payment Methods',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          ),
        ),


        if (role == 'admin')
          _buildOptionTile(
            icon: Icons.dashboard,
            title: 'Admin Dashboard',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AdminDashboard()),
            ),
          ),

        Divider(),
        _buildOptionTile(
          icon: Icons.exit_to_app,
          title: 'Logout',
          onTap: () => _showLogoutDialog(context),
        ),
      ],
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Login()),
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
