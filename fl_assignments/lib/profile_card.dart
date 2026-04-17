import 'package:flutter/material.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      appBar: AppBar(
        title: const Text('Profile Card'),
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60.0,
                color: Colors.teal,
              ),
            ),
            const Text(
              'Subrat Singh',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+91 123 456 7890',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'subrat@example.com',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
