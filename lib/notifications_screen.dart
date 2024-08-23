import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
            title: Text('Request to join the group "XYZ" is accepted'),
            subtitle: Text('2 days ago'),
          ),
          ListTile(
            title: Text('Owner’s privacy and policies have been updated'),
            subtitle: Text('5 days ago'),
          ),
        ],
      ),
    );
  }
}
