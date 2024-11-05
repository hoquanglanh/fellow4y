import 'package:flutter/material.dart';
import 'package:homework/screens/home.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  // List to keep track of favorite states
  List<bool> isFavoriteList = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Plenty of amazing of tours are waiting for you',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.search,
                                    color: Color.fromARGB(255, 98, 96, 96)),
                                SizedBox(width: 10),
                                Text(
                                  'Hi, where do you want to explore?',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 113, 111, 111)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ...List.generate(6, (index) => buildTripCard(index)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 135, 168, 205),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        child: const Icon(
          Icons.arrow_back_sharp,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
      ),
    );
  }

  Widget buildTripCard(int index) {
    final List<Map<String, dynamic>> tripData = [
      {
        'title': 'Da Nang - Ba Na - Hoi An',
        'image': 'assets/images/e.png',
        'price': 400.00
      },
      {
        'title': 'Melbourne - Sydney',
        'image': 'assets/images/f.png',
        'price': 600.00
      },
      {
        'title': 'HaNoi - HaLongBay',
        'image': 'assets/images/g.png',
        'price': 300.00
      },
      {
        'title': 'Da Nang - Ba Na - Hoi An',
        'image': 'assets/images/e.png',
        'price': 400.00
      },
      {
        'title': 'Melbourne - Sydney',
        'image': 'assets/images/f.png',
        'price': 600.00
      },
      {
        'title': 'HaNoi - HaLongBay',
        'image': 'assets/images/g.png',
        'price': 300.00
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    tripData[index]['image'],
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.bookmark_outline_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 23,
                          );
                        }),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '1247 likes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tripData[index]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavoriteList[index] = !isFavoriteList[index];
                          });
                        },
                        child: Icon(
                          isFavoriteList[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,
                              size: 20, color: Colors.grey),
                          SizedBox(width: 5),
                          Text('Jan 30, 2020',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 20, color: Colors.grey),
                              SizedBox(width: 5),
                              Text('3 days',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Text(
                            '\$${tripData[index]['price'].toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
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
}
