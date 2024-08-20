import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Colors.white,
        elevation: 1.0,
        automaticallyImplyLeading: false, // No back button
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar and Categories
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What are you looking for today?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.filter_list),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Categories
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip("Wallets", Icons.account_balance_wallet),
                    _buildCategoryChip("Travel", Icons.flight_takeoff),
                    _buildCategoryChip("Fashion", Icons.style),
                    _buildCategoryChip("Home", Icons.home),
                    _buildCategoryChip("Electronics", Icons.electrical_services),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Results Section
              Text(
                "26 results",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              _buildProductItem("Y-Pack Unisex Bag", "50", "assets/bag1.png"),
              _buildProductItem("Y-Pack Unisex Bag", "50", "assets/bag1.png"),
              SizedBox(height: 16),
              // Suggested Filters
              Text(
                "Suggested Filters",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip("Leather"),
                  _buildFilterChip("Vegan"),
                  _buildFilterChip("Men's"),
                  _buildFilterChip("Women's"),
                ],
              ),
              SizedBox(height: 16),
              _buildPriceSlider(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Apply"),
              ),
              SizedBox(height: 16),
              // Notification Section
              Text(
                "Get notified for best deals",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "email@domain.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Notify me"),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Additional Products
              _buildProductItem("Y-Pack Unisex Bag", "50", "assets/bag1.png"),
              _buildProductItem("Y-Pack Unisex Bag", "50", "assets/bag1.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
        label: Row(
          children: [
            Icon(icon, size: 18),
            SizedBox(width: 4),
            Text(label),
          ],
        ),
        backgroundColor: Colors.grey.shade200,
      ),
    );
  }

  Widget _buildProductItem(String title, String price, String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_border),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget _buildPriceSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price Range",
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        RangeSlider(
          values: RangeValues(30, 120),
          min: 0,
          max: 200,
          divisions: 4,
          labels: RangeLabels('30', '120'),
          onChanged: (RangeValues values) {
            // Handle price range changes
          },
        ),
      ],
    );
  }
}
