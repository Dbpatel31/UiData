import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customdrawer extends StatelessWidget {
  final String username;
  final String email;

  const Customdrawer({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(

      decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue.shade900, Colors.blue.shade600],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

          ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue.shade800),
            ),
            accountName: Text(username,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            accountEmail: Text(email),
          ),

          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(Icons.home, "Home", () {
                  Get.back();
                  Get.snackbar("Navigation", "Home clicked");
                }),
                _buildDrawerItem(Icons.person, "Profile", () {
                  Get.back();
                  Get.snackbar("Navigation", "Profile clicked");
                }),
                _buildDrawerItem(Icons.notifications, "Notifications", () {
                  Get.back();
                  Get.snackbar("Navigation", "Notifications clicked");
                }),
                _buildDrawerItem(Icons.settings, "Settings", () {
                  Get.back();
                  Get.snackbar("Navigation", "Settings clicked");
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.red.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Get.snackbar("Logout", "User logged out");
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text("Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade800),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
