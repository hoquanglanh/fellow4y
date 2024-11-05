import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fellow4U',
          style: TextStyle(
            color: Color(0xFF00CEA6),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nenn.png',
              width: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Create a trip and get offers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Fellow4U helps you save time and get\n'
              'offers from hundred local guides that\n'
              'suit your trip.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _showNavigationOptions(context),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00CEA6),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNavigationOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Options'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildNavigationOption(context, 'Home Guides', '/screen2'),
                _buildNavigationOption(context, 'Home Tours', '/screen3'),
                _buildNavigationOption(context, 'Tour Detail', '/screen4'),
                _buildNavigationOption(context, 'Search', '/screen5'),
                _buildNavigationOption(context, 'Explore', '/screen6'),
                _buildNavigationOption(context, 'Trips Current', '/screen7'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationOption(
      BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog
        Navigator.pushNamed(context, route);
      },
    );
  }
}
