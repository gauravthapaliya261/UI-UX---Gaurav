// details_page.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'book_inspection_page.dart';

class DetailsPage extends StatelessWidget {
  final String heading;

  DetailsPage({
    Key? key,
    required this.heading,
  }) : super(key: key);

  // Set default values for other information
  final List<String> imagePaths = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    // Add more image paths as needed
  ];
  final String price = '\$500'; // Replace with the actual default value
  final String address = '123 Main St'; // Replace with the actual default value
  final String frequency = 'Monthly'; // Replace with the actual default value
  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Slider Section
          CarouselSlider(
            items: imagePaths.map((imagePath) {
              return Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 220.0,
              enableInfiniteScroll: false,
              viewportFraction: 1.0, // Full width of the viewport
              aspectRatio: 16 / 9, // Set the aspect ratio as needed
              onPageChanged: (index, reason) {
                // Handle page change if needed
              },
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn, // Custom animation curve
              autoPlayInterval:
                  const Duration(seconds: 3), // Custom interval duration
            ),
          ),
          // Heading Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Side - Heading and Location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(
                              0xFF4DB87E), // You can adjust the color as needed
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          address,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF4DB87E),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // Right Side - Price and Frequency
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      frequency,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Description Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Read More...',
                  style: TextStyle(
                    fontSize: 16.0,
                    color:
                        Theme.of(context).primaryColor, // Set to primary color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Facilities Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Facilities',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Compact Bullet List of Facilities
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFacility('Free WiFi'),
                    _buildFacility('Parking Available'),
                    _buildFacility('Swimming Pool'),
                    _buildFacility('Gym'),
                    // Add more facilities as needed
                  ],
                ),
              ],
            ),
          ),
          // Booking Section
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Circled Outline Bookmark Icon
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0, // Adjust the border width
                    ),
                  ),
                  child: Icon(
                    Icons.bookmark_outline,
                    color: Theme.of(context).primaryColor,
                    size: 32.0, // Adjust the icon size
                  ),
                ),
                const SizedBox(
                    width: 16.0), // Add space between icon and button
                // Book an Inspection Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to BookInspectionPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookInspectionPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0), // Adjust the button padding
                    ),
                    child: const Text(
                      'Book an Inspection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0, // Adjust the button text size
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacility(String facility) {
    return Row(
      children: [
        const Icon(Icons.check), // Tick mark icon
        const SizedBox(width: 8.0), // Adjust the gap between icon and text
        Text(
          facility,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
