import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
      margin: const EdgeInsets.all(40),
      child: SafeArea(
        //child: Padding(
          //padding: const EdgeInsets.all(0.0), // 40px padding from screen edges
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Circular Profile Image
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmLlz4kiZ23iny0wdtSPKQSpK-tpZfuM2QAQ&s'
                    ),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Name
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                 // const SizedBox(height: 16),
                  
                  // Bio
                  Text(
                    'Software Developer & Flutter Enthusiast',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  
                  Text(
                    'Passionate about creating beautiful mobile applications and exploring new technologies. Love to code, learn, and share knowledge with the community.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
       // ),
      ),
    )
    );
  }
}