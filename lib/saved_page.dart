// saved_page.dart

import 'package:flutter/material.dart';
import 'custom_bottom_navbar.dart';
import 'details_page.dart'; // Import your DetailsPage widget

class SavedPage extends StatelessWidget {
  // Sample data for saved items
  final List<Map<String, dynamic>> savedItems = [
    {
      'image': 'assets/images/img1.jpg',
      'heading': '2BHK Flat',
      'location': '123 Main St',
    },
    {
      'image': 'assets/images/img2.jpg',
      'heading': '1 Shared Room',
      'location': '456 Oak St',
    },
    {
      'image': 'assets/images/img3.jpg',
      'heading': '1BHK Apartment',
      'location': '110A Park Rd',
    },
    {
      'image': 'assets/images/img4.jpg',
      'heading': '1 Bedroom Studio',
      'location': '25 Bond St',
    },
    {
      'image': 'assets/images/img5.jpg',
      'heading': '3BHK Townhouse',
      'location': '456 Oak St',
    }
    // Add more saved items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: savedItems.length,
        itemBuilder: (context, index) {
          return _buildSavedItemCard(context, savedItems[index]);
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index == 0) {
            // Navigate to the Home page
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            // Handle other navigation if needed
          } else if (index == 2) {
            // Handle other navigation if needed
          } else if (index == 3) {
            // Handle other navigation if needed
          }
        },
      ),
    );
  }

  Widget _buildSavedItemCard(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        // Navigate to the details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              // Pass the necessary details to the DetailsPage
              heading: item['heading'],
              // Pass other details as needed
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular image
              ClipOval(
                child: Image.asset(
                  item['image'],
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading
                    Text(
                      item['heading'],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Location with icon
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          item['location'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    // View More Details
                    const Text(
                      'View More Details >',
                      style: TextStyle(
                        fontSize: 12.0,
                        // color: Color(0xFF4DB87E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              // Bookmark icon
              const Icon(
                Icons.bookmark,
                color: Color(0xFF4DB87E),
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
