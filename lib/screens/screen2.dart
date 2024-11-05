import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/banner.png',
                  width: double.infinity, fit: BoxFit.cover, height: 200),
              Positioned(
                top: 40,
                left: 20,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Text(
                  'Book your own private local Guide and explore the city',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Hi, where do you want to explore?',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                final guides = [
                  {
                    'name': 'Tuan Tran',
                    'location': 'Danang, Vietnam',
                    'image': 'tuantran.png'
                  },
                  {
                    'name': 'Emmy',
                    'location': 'Hanoi, Vietnam',
                    'image': 'emmy.png'
                  },
                  {
                    'name': 'Linh Hana',
                    'location': 'Danang, Vietnam',
                    'image': 'linh.png'
                  },
                  {
                    'name': 'Khai',
                    'location': 'Ho Chi Minh, Vietnam',
                    'image': 'khai.png'
                  },
                  {
                    'name': 'Tuan Tran',
                    'location': 'Danang, Vietnam',
                    'image': 'tuantran.png'
                  },
                  {
                    'name': 'Emmy',
                    'location': 'Hanoi, Vietnam',
                    'image': 'emmy.png'
                  },
                  {
                    'name': 'Linh Hana',
                    'location': 'Danang, Vietnam',
                    'image': 'linh.png'
                  },
                  {
                    'name': 'Khai',
                    'location': 'Ho Chi Minh, Vietnam',
                    'image': 'khai.png'
                  },
                ];
                return GuideCard(
                  name: guides[index]['name']!,
                  location: guides[index]['location']!,
                  imagePath: 'assets/images/${guides[index]['image']}',
                  rating: 4.5,
                  reviewCount: 127,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String name;
  final String location;
  final String imagePath;
  final double rating;
  final int reviewCount;

  // ignore: use_super_parameters
  const GuideCard({
    Key? key,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                          5,
                          (index) =>
                              Icon(Icons.star, color: Colors.yellow, size: 16)),
                      SizedBox(width: 4),
                      Text(
                        '$reviewCount Reviews',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF00CEA6), size: 16),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF00CEA6)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
