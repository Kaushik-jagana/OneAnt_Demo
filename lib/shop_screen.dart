import 'package:flutter/material.dart';
import 'package:one_ant/more_screen.dart';

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                          _buildCategoryChip(
                              "Wallets", Icons.account_balance_wallet),
                          _buildCategoryChip("Travel", Icons.flight_takeoff),
                          _buildCategoryChip("Fashion", Icons.style),
                          _buildCategoryChip("Home", Icons.home),
                          _buildCategoryChip(
                              "Electronics", Icons.electrical_services),
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
                    _buildProductItem(
                        "Y-Pack Unisex Bag", "50", "assets/bag1.png"),
                    _buildProductItem(
                        "Y-Pack Unisex Bag", "50", "assets/bag1.png"),
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
                    _buildProductItem(
                        "Y-Pack Unisex Bag", "50", "assets/bag1.png"),
                    _buildProductItem(
                        "Y-Pack Unisex Bag", "50", "assets/bag1.png"),
                  ],
                ),
              ),
            ),
          ),
          // Filters & Sort Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                // Show the filter and sort modal
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return _buildFilterSortModal(context);
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_list, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Filters & Sort", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 8),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: 0, // Set the current index as needed
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoreScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildFilterSortModal(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter & Sort',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Pick your Interest',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: [
              _buildInterestChip("All", true),
              _buildInterestChip("Home Decor", false),
              _buildInterestChip("Electronics", false),
              _buildInterestChip("Wellness", true),
              _buildInterestChip("Travel", true),
              _buildInterestChip("Pets", false),
              _buildInterestChip("Fashion", false),
              _buildInterestChip("Kitchen", false),
              _buildInterestChip("DIY Tool", false),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Price Range',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: [
              _buildPriceChip("All", true),
              _buildPriceChip("\$10 - \$50", false),
              _buildPriceChip("\$50 - \$100", false),
              _buildPriceChip("\$100 - \$150", false),
              _buildPriceChip("\$150 - \$500", false),
              _buildPriceChip("\$500+", false),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Sort by',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          _buildSortOption("Popular first", true),
          _buildSortOption("Date posted", false),
          _buildSortOption("Price", false),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Apply filter and sort logic
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(child: Text('Apply')),
          ),
        ],
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

  Widget _buildInterestChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        // Handle interest selection
      },
      selectedColor: Colors.blue.shade100,
      backgroundColor: Colors.grey.shade200,
      checkmarkColor: Colors.blue,
    );
  }

  Widget _buildPriceChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        // Handle price selection
      },
      selectedColor: Colors.blue.shade100,
      backgroundColor: Colors.grey.shade200,
      checkmarkColor: Colors.blue,
    );
  }

  Widget _buildSortOption(String label, bool isSelected) {
    return ListTile(
      title: Text(label),
      leading: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: isSelected ? Colors.black : Colors.grey,
      ),
      onTap: () {
        // Handle sort option selection
      },
    );
  }
}
