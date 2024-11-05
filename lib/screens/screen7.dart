import 'package:flutter/material.dart';
import 'package:homework/screens/home.dart';
import 'package:homework/screens/screen10.dart';
import 'package:homework/screens/screen8.dart';
import 'package:homework/screens/screen9.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  void _navigateToScreen8(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screen8()),
    );
  }

  void _navigateToScreen9(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screen9()),
    );
  }

  // Add this new method
  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  void _navigateToScreen10(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Screen10()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/danang.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            // Wrap the text with GestureDetector
                            onTap: () =>
                                _navigateToHome(context), // Add this line
                            child: const Text(
                              'My Trips',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      _buildTab('Current Trips', isSelected: true),
                      _buildTab('Next Trips',
                          onTap: () => _navigateToScreen8(context)),
                      _buildTab('Past Trips',
                          onTap: () => _navigateToScreen9(context)),
                      _buildTab('Wish List'),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.asset(
                                'assets/images/k.png',
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 165, 163, 163),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check,
                                        size: 18, color: Colors.black54),
                                    SizedBox(width: 4),
                                    Text('Mark Finished',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 10,
                              left: 10,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.white, size: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    'Da Nang, Vietnam',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Dragon Bridge Trip',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(height: 8),
                                    _buildInfoRow(Icons.calendar_today_outlined,
                                        'Jan 30, 2020'),
                                    const SizedBox(height: 4),
                                    _buildInfoRow(
                                        Icons.access_time, '13:00 - 15:00'),
                                    const SizedBox(height: 4),
                                    _buildInfoRow(
                                        Icons.person_outline, 'Tuan Tran'),
                                    const SizedBox(height: 12),
                                    OutlinedButton.icon(
                                      icon: const Icon(Icons.add_circle_outline,
                                          size: 18),
                                      label: const Text('Detail'),
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFF00CEA6),
                                        side: const BorderSide(
                                            color: Color(0xFF00CEA6)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xFF00CEA6), width: 2),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                      'assets/images/tuantran.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 300),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16, // Move the button lower
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xFF00CEA6),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00CEA6),
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          if (index == 2) {
            // Index 2 corresponds to the message icon
            _navigateToScreen10(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'My Trips'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Widget _buildTab(String text,
      {bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Chip(
          label: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
          backgroundColor:
              isSelected ? const Color(0xFF00CEA6) : Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
