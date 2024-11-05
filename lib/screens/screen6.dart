import 'package:flutter/material.dart';

class Screen6 extends StatelessWidget {
  // ignore: use_super_parameters
  const Screen6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/caurong.png',
              width: 375,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 20, color: Colors.white),
                              SizedBox(width: 4),
                              Text('Da Nang',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.cloud, size: 50, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                '26°C',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Top Journeys',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  child: _buildJourneyCard(
                                'Da Nang - Ba Na - Hoi An',
                                '1247',
                                'Jan 30, 2020',
                                '3 days',
                                '\$400.00',
                                'assets/images/dan.png',
                              )),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildJourneyCard(
                                'Thailand',
                                '1247',
                                'Jan 30, 2020',
                                '3 days',
                                '\$600.00',
                                'assets/images/thai.png',
                              )),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Best Guides',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'SEE MORE',
                                style: TextStyle(
                                    color: Color(0xFF00CEA6),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Tuan Tran và Emmy
                          Row(
                            children: [
                              Expanded(
                                  child: _buildGuideCard(
                                'Tuan Tran',
                                'Da Nang, Vietnam',
                                'assets/images/tuantran.png',
                                5,
                                127,
                              )),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildGuideCard(
                                'Emmy',
                                'Hanoi, Vietnam',
                                'assets/images/emmy.png',
                                5,
                                127,
                              )),
                            ],
                          ),
                          SizedBox(height: 20),
                          // Linh và Khai
                          Row(
                            children: [
                              Expanded(
                                  child: _buildGuideCard(
                                'Linh',
                                'Ho Chi Minh City, Vietnam',
                                'assets/images/linh.png',
                                4,
                                98,
                              )),
                              SizedBox(width: 16),
                              Expanded(
                                  child: _buildGuideCard(
                                'Khai',
                                'Hue, Vietnam',
                                'assets/images/khai.png',
                                5,
                                152,
                              )),
                            ],
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Top Experiences',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildExperienceCard(
                                  'Tuan Tran',
                                  '2 Hour Bicycle Tour exploring Hoian',
                                  'Hoian, Vietnam',
                                  'assets/images/aa.png',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: _buildExperienceCard(
                                  'Linh Hana',
                                  '1 day at Bana Hill',
                                  'Bana, Vietnam',
                                  'assets/images/bb.png',
                                ),
                              ),
                            ],
                          ),
                        ],
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

  Widget _buildExperienceCard(
    String guideName,
    String title,
    String location,
    String imagePath,
  ) {
    return SizedBox(
      width: 160,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xFF00CEA6),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/tuantran.png'),
                      radius: 20, // Tăng kích thước avatar
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
                  SizedBox(
                    height: 40, // Đặt chiều cao cố định cho phần tiêu đề
                    child: Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Color(0xFF00CEA6), size: 14),
                      SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          location,
                          style:
                              TextStyle(color: Color(0xFF00CEA6), fontSize: 12),
                          maxLines: 1,
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
      ),
    );
  }

  Widget _buildJourneyCard(String title, String likes, String date,
      String duration, String price, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.bookmark_border, color: Colors.white),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                color: Colors.yellow, size: 14)),
                      ),
                      SizedBox(width: 4),
                      Text(likes, style: TextStyle(color: Colors.white)),
                      Text(' likes', style: TextStyle(color: Colors.white)),
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
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(date, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(duration, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                      color: Color(0xFF00CEA6),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard(String name, String location, String imagePath,
      double rating, int reviews) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '$reviews Reviews',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF00CEA6), size: 16),
                    SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Color(0xFF00CEA6), fontSize: 14),
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
