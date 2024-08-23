import 'package:flutter/material.dart';
import 'package:one_ant/groups_screen.dart';
import 'package:one_ant/notifications_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: Colors.white,
        elevation: 1.0,
        automaticallyImplyLeading: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'), // Placeholder
            ),
            title: Text('Shiv K'),
            subtitle: Text('View Profile'),
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Groups'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Settings & Privacy'),
            onTap: () {
              // Navigate to Settings & Privacy Screen
            },
          ),
          ListTile(
            title: Text('Become a Supplier'),
            onTap: () {
              // Navigate to Become a Supplier Screen
            },
          ),
          ListTile(
            title: Text('Terms & Conditions'),
            onTap: () {
              // Navigate to Terms & Conditions Screen
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Handle Logout
            },
          ),
        ],
      ),
    );
  }
}
