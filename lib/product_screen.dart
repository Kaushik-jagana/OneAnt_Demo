import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String originalPrice;
  final String discountedPrice;
  final String imageUrl;

  ProductDetailsPage({
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Implement sharing functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Implement favorite functionality here
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image and Info
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'By forever 21',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.flash_on, color: Colors.purple, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Hurry! Selling fast",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "\$$discountedPrice",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "\$$originalPrice",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "50% OFF",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    value: '1 PC',
                    items:
                        <String>['1 PC', '2 PCs', '3 PCs'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Handle change
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.group, color: Colors.orange),
                  SizedBox(width: 8),
                  Text(
                    "Join group to get discount",
                    style: TextStyle(color: Colors.orange),
                  ),
                  Spacer(),
                  Text(
                    "09:56",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              // Product Details, Shipping Information, Warranty
              ExpansionTile(
                title: Text("Product details"),
                leading: Icon(Icons.info_outline),
                children: <Widget>[
                  ListTile(
                    title: Text("Product details content here..."),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Shipping information"),
                leading: Icon(Icons.local_shipping),
                children: <Widget>[
                  ListTile(
                    title: Text("Shipping information content here..."),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Warranty"),
                leading: Icon(Icons.verified),
                children: <Widget>[
                  ListTile(
                    title: Text("Warranty content here..."),
                  ),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.eco, color: Colors.green),
                title: Text("Your order ships carbon neutral"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Implement buy with group functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text('Buy with Group',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Implement buy yourself functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'Buy Yourself',
                  style:
                      TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
