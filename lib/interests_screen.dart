import 'package:flutter/material.dart';
import 'package:one_ant/shop_screen.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  String? selectedStore;
  String selectedDistance = "10 miles";
  List<String> selectedInterests = [];

  final List<String> stores = [
    "Select a Store",
    "Store 1",
    "Store 2",
    "Store 3"
  ];
  final List<String> distances = [
    "10 miles",
    "20 miles",
    "30 miles",
    "40 miles"
  ];
  final List<Map<String, dynamic>> interests = [
    {"name": "Events", "image": "assets/events.jpg"},
    {"name": "Fashion & jewellery", "image": "assets/fashion_jewelry.jpg"},
    {"name": "Fun & Entertainment", "image": "assets/fun_entertainment.jpg"},
    {"name": "Shoes", "image": "assets/health_fitness.jpg"},
    {"name": "Sport & Outdoor", "image": "assets/sports__outdoor.jpg"},
    {"name": "Tours & Travel", "image": "assets/tours_travel.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Frame 1 - Header with title and placeholder for "x"
              Container(
                width: 375,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      color: Colors.transparent, // Placeholder for "x" button
                    ),
                    const Text(
                      'Pick Interests',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF2A2A2A),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      color:
                          Colors.transparent, // Placeholder for any other icon
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Subtitle
              const Text(
                'Store',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF2A2A2A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              // Store dropdown
              DropdownButtonFormField<String>(
                value: selectedStore,
                hint: Text("Select a Store"),
                items: stores.map((String store) {
                  return DropdownMenuItem<String>(
                    value: store,
                    child: Text(store),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedStore = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Distance selection
              Container(
                child: Wrap(
                  children: distances.map((distance) {
                    return ChoiceChip(
                      padding: EdgeInsets.all(5),
                      label: Text(distance),
                      selected: selectedDistance == distance,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedDistance = distance;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 24),
              // Interests grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: interests.length,
                  itemBuilder: (context, index) {
                    final interest = interests[index];
                    final isSelected =
                        selectedInterests.contains(interest["name"]);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedInterests.remove(interest["name"]);
                          } else {
                            selectedInterests.add(interest["name"]);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.blue.shade50 : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.blue : Color(0xFFE5E7EA),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(interest["image"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              interest["name"],
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF2A2A2A),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              // Get Results Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShopScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50), // Full-width button
                ),
                child: Text('Get Results'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Handle "I'll do it later" logic here
                },
                child: Text('I’ll do it later'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
