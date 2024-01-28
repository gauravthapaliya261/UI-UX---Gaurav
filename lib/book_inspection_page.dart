import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'custom_bottom_navbar.dart';
import 'saved_page.dart';

class BookInspectionPage extends StatefulWidget {
  @override
  _BookInspectionPageState createState() => _BookInspectionPageState();
}

class _BookInspectionPageState extends State<BookInspectionPage> {
  int _currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Inspection'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Select Date
              const Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4DB87E)),
                  ),
                ),
                controller: TextEditingController(
                  text: selectedDate.toLocal().toString().split(' ')[0],
                ),
              ),
              const SizedBox(height: 16.0),

              // Select Time
              const Text(
                'Select Time',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                readOnly: true,
                onTap: () => _selectTime(context),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                controller: TextEditingController(
                  text: selectedTime.format(context),
                ),
              ),
              const SizedBox(height: 16.0),

              // Message to the Owner
              const Text(
                'Message to the Owner (optional)',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: messageController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              // Book Button
              ElevatedButton(
                onPressed: () {
                  // Handle book action
                  _handleBooking();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 32.0),
                ),
                child: const Text(
                  'Book',
                  style: TextStyle(
                    fontSize: 18.0, // Adjust the button text size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              // Navigate to Home Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  // Function to handle booking action
  void _handleBooking() {
    // Perform booking logic here

    // Show booking successful alert
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Successful'),
          content: const Text('Your inspection has been booked successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();

                // Navigate back to the home page
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
