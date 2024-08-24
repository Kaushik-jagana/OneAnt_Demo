import 'package:flutter/material.dart';
import 'package:one_ant/more_screen.dart';
import 'package:one_ant/product_screen.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // State variables
  String selectedCategory = "All";
  RangeValues selectedPriceRange = RangeValues(30, 120);
  List<String> selectedFilters = ['Wellness', 'Travel', 'Price'];
  String selectedSortOption = "Popular first";

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
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
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
                            SizedBox(width: 15),
                            _buildCategoryChip(
                                "Wallets",
                                'https://oneant.ca/images/homepage/online_courses.jpg',
                                true),
                            SizedBox(width: 15),
                            _buildCategoryChip(
                                "Travel",
                                'https://oneant.ca/images/homepage/tours_travel.jpg',
                                true),
                            SizedBox(width: 15),
                            _buildCategoryChip(
                                "Fashion",
                                'https://oneant.ca/images/homepage/fashion_jewelry.jpg',
                                false),
                            SizedBox(width: 15),
                            _buildCategoryChip(
                                "Home",
                                'https://oneant.ca/images/homepage/sports_outdoor.jpg',
                                false),
                            SizedBox(width: 15),
                            _buildCategoryChip(
                                "Electronics",
                                'https://oneant.ca/images/homepage/groceries.jpg',
                                false),
                            SizedBox(width: 15),
                            _buildCategoryChip(
                                "Wellness",
                                'https://oneant.ca/images/homepage/groceries.jpg',
                                false),
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
                      _buildProductItem("Y-Pack Unisex Bag", "100", "50",
                          "assets/bag1.jpeg", context),
                      _buildProductItem("Y-Pack Unisex Bag", "100", "50",
                          "assets/bag1.jpeg", context),
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
                        onPressed: () {
                          setState(() {
                            // Apply the selected filters
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize:
                              Size(double.infinity, 50), // Full-width button
                        ),
                        child: Text(
                          'Apply',
                          style: TextStyle(
                              color: Colors.black), // Set text color to black
                        ),
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
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Notify Me',
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      Colors.black), // Set text color to black
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Additional Products
                      _buildProductItem("Y-Pack Unisex Bag", "100", "50",
                          "assets/bag1.jpeg", context),
                      _buildProductItem("Y-Pack Unisex Bag", "100", "50",
                          "assets/bag1.jpeg", context),
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
                    Text("Filters & Sort",
                        style: TextStyle(color: Colors.white)),
                    SizedBox(width: 8),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Text(
                        selectedFilters.length.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        onTap: (int index) {
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
              setState(() {
                // Apply the selected filters and sort options
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
                child: Text(
              'Apply',
              style: TextStyle(color: Colors.black),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, String imageUrl, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey.shade800 : Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl,
              width: 40,
              height: 38,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryProductChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.white.withOpacity(0),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildProductItem(String title, String originalPrice,
      String discountedPrice, String imageUrl, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                title: title,
                originalPrice: originalPrice,
                discountedPrice: discountedPrice,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: _buildCategoryProductChip("TRAVEL"),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    "\$$originalPrice",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "\$$discountedPrice",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green,
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
                ],
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
            ],
          ),
        ));
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      selected: selectedFilters.contains(label),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedFilters.add(label);
          } else {
            selectedFilters.remove(label);
          }
        });
      },
      selectedColor: Colors.blue.shade100,
      backgroundColor: Colors.grey.shade200,
      checkmarkColor: Colors.blue,
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
          values: selectedPriceRange,
          min: 0,
          max: 200,
          divisions: 4,
          labels: RangeLabels(
            selectedPriceRange.start.round().toString(),
            selectedPriceRange.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              selectedPriceRange = values;
            });
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
        setState(() {
          // Update selection state for interests
        });
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
        setState(() {
          // Update selection state for price ranges
        });
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
        setState(() {
          selectedSortOption = label;
        });
      },
    );
  }
}
