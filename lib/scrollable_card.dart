import 'package:flutter/material.dart';
import 'details_page.dart'; // Import the details page

class ScrollableCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String heading;
  final bool isNearbySection; // Flag to indicate if the card is in the Nearby section

  const ScrollableCard({
    Key? key,
    required this.image,
    required this.heading,
    required this.isNearbySection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNearbySection
        ? GestureDetector(
            onTap: () {
              // Handle card tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    heading: heading
                  ),
                ),
              );
            },
            child: buildCard(),
          )
        : buildCard();
  }

  Container buildCard() {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 160.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: image,
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            heading,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
