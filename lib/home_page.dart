import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_bottom_navbar.dart';
import 'logo_section.dart';
import 'saved_page.dart';
import 'scrollable_card.dart';
import 'section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0), // Make the AppBar invisible
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Background Image Container
            SizedBox(
              height: 220.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: const AssetImage('assets/images/img6.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black
                          .withOpacity(0.25), // Adjust the opacity as needed
                      BlendMode.darken,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.3), // Adjust the shadow color
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2), // Adjust the shadow offset
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Logo section
                    Positioned(
                      left: 30.0,
                      top: 50.0,
                      child: LogoSection(
                        fontColor: Theme.of(context).primaryColor,
                        fontSize: 31,
                      ),
                    ),
                    // Burger menu icon
                    Positioned(
                      left: 18.0,
                      top: 30.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 243, 243, 243)
                                  .withOpacity(0.3),
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.menu_rounded),
                          onPressed: () {
                            // Handle burger menu action
                          },
                          iconSize: 44.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    // User profile icon
                    Positioned(
                      right: 18.0,
                      top: 30.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 243, 243, 243)
                                  .withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.account_circle_outlined),
                          onPressed: () {
                            // Handle profile icon action
                          },
                          iconSize: 44.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    // Your content goes here
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Additional content
                        // You can add more widgets, content, etc.
                      ],
                    ),
                    // Adjusted Login Section closer to the top
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Additional login section content
                          // You can add TextFields, buttons, etc.
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
// Categories Section
            const Section(
              heading: 'Categories',
              seeAllText: 'See All',
              items: [
                ScrollableCard(
                  image: AssetImage('assets/images/img1.jpg'),
                  heading: 'Apartment',
                  isNearbySection: false,
                ),
                ScrollableCard(
                  image: AssetImage('assets/images/img2.jpg'),
                  heading: 'Studio',
                  isNearbySection: false,
                ),
                ScrollableCard(
                  image: AssetImage('assets/images/img3.jpg'),
                  heading: 'Unit',
                  isNearbySection: false,
                ),
                ScrollableCard(
                  image: AssetImage('assets/images/img4.jpg'),
                  heading: 'Townhouse',
                  isNearbySection: false,
                )
                // Add more cards as needed
              ],
            ),
            // Nearby You Section
            const Section(
              heading: 'Nearby You',
              seeAllText: 'See All',
              items: [
                ScrollableCard(
                  image: AssetImage('assets/images/img4.jpg'),
                  heading: '2BHK Flat',
                  isNearbySection: true,
                ),
                ScrollableCard(
                  image: AssetImage('assets/images/img3.jpg'),
                  heading: '1 Bedroom Studio',
                  isNearbySection: true,
                ),
                ScrollableCard(
                  image: AssetImage('assets/images/img2.jpg'),
                  heading: '3BHK Apartment',
                  isNearbySection: true,
                ),
                ScrollableCard(
                  image: AssetImage('assets/images/img1.jpg'),
                  heading: 'Granny Flat',
                  isNearbySection: true,
                ),
                // Add more cards as needed
              ],
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search any places',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF4DB87E),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation based on the index
            if (index == 1) {
              // Navigate to Saved Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedPage()),
              );
            }
          });
        },
      ),
    );
  }
}
