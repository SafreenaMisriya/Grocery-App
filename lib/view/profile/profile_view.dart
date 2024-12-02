import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:NetworkImage('https://img.freepik.com/premium-vector/people-profile-icon_24877-40756.jpg?uid=R143973590&ga=GA1.1.1665061409.1697998385&semt=ais_hybrid'), // Replace with your image path
                ),
                SizedBox(height: 10),
                Text(
                  'Ajith',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'absss@gmail.com',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildProfileOption(Icons.person, "My Profile", () {}),
                _buildProfileOption(Icons.location_on, "My Address", () {}),
                _buildProfileOption(Icons.shopping_cart, "My Orders", () {}),
               
                _buildProfileOption(Icons.settings, "Setting", () {}),
                _buildProfileOption(Icons.logout, "Log Out", () {}, isLogout: true),
              ],
            ),
          ),
        ],
      ),
    
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
