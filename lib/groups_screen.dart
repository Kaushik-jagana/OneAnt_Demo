import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text('Sky Importers'),
              subtitle: Text('Top Groups'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle Join Request
                },
                child: Text('Request to Join'),
              ),
            ),
            ListTile(
              title: Text('Quick Buy'),
              subtitle: Text('My Groups'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle Manage Group
                },
                child: Text('Manage'),
              ),
            ),
            ListTile(
              title: Text('Make your Group'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle Create Group
                },
                child: Text('Create a Group'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
