import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack for header image and icons
            Stack(
              children: [
                Image.asset(
                  'assets/images/123.png', // Background image
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 250,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.white, size: 30),
                        onPressed: () {
                          // Gọi phương thức showDialog để hiển thị hộp thoại chia sẻ
                          _showShareDialog(context);
                        },
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.favorite_border,
                          color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ],
            ),

            // Summary Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for title and price
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Da Nang - Ba Na - Hoi An',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$400.00',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF00CEA6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$450.00',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        '145 Reviews',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Provider ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        TextSpan(
                          text: 'dulichviet',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF00CEA6),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  _buildSectionHeader('Summary'),
                  _buildSummaryDetail('Itinerary', 'Da Nang - Ba Na - Hoi An'),
                  _buildSummaryDetail('Duration', '2 days, 2 nights'),
                  _buildSummaryDetail('Departure Date', 'Feb 12'),
                  _buildSummaryDetail('Departure Place', 'Ho Chi Minh'),
                ],
              ),
            ),

            // Schedule Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Schedule'),
                  _buildScheduleDayTab(),
                  const SizedBox(height: 10),
                  _buildScheduleDetail(
                    time: '6:00 AM',
                    description:
                        'Departure from Ho Chi Minh to Da Nang. Check-in at the hotel and free time to explore the city.',
                  ),
                  _buildScheduleDetail(
                    time: '10:00 AM',
                    description:
                        'Visit Marble Mountains and explore ancient caves and temples.',
                  ),
                  _buildScheduleDetail(
                    time: '1:00 PM',
                    description:
                        'Lunch at a local restaurant, then visit Ba Na Hills and the famous Golden Bridge.',
                  ),
                  _buildScheduleDetail(
                    time: '8:00 PM',
                    description:
                        'Free evening to explore Da Nang nightlife or relax at the hotel.',
                  ),
                ],
              ),
            ),

            // Price Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Price'),
                  _buildPriceDetail('Adult (>10 years old)', '\$400.00'),
                  _buildPriceDetail('Child (5-10 years old)', '\$320.00'),
                  _buildPriceDetail('Child (<5 years old)', 'Free'),
                ],
              ),
            ),

            // Book Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color(0xFF00CEA6),
                  ),
                  onPressed: () {
                    // Handle book action
                  },
                  child: const Text(
                    'BOOK THIS TOUR',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Phương thức để hiển thị hộp thoại chia sẻ
  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Share on',
            textAlign: TextAlign.center, // Center-align the title
          ),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Minimize column size to fit content
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Distribute icons evenly
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/facebook.png'),
                        onPressed: () {},
                      ),
                      const Text(
                        'Facebook',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/google.png'),
                        onPressed: () {},
                      ),
                      const Text(
                        'Google',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/talk.png'),
                        onPressed: () {},
                      ),
                      const Text(
                        'Talk',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/call.png'),
                        onPressed: () {},
                      ),
                      const Text(
                        'App',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/twit.png'),
                        onPressed: () {},
                      ),
                      const Text(
                        'Twitter',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                  height: 20), // Add space between icons and Cancel button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0), // Adjust padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18.0, // Set font size for button text
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper methods for building sections

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSummaryDetail(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleDayTab() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFF00CEA6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Day 1',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Day 2',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleDetail(
      {required String time, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.teal,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetail(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
