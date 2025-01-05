import 'package:flutter/material.dart';
import 'package:mycarmanager_new/question1.dart';
import 'home_page.dart';

class  StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Background color
      body: GestureDetector(
        onTap: () {
          // Action for tapping anywhere on the screen
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestionPage()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            // Title Text
            Text(
              "Let's Start!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Spacer(flex: 1),
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/carphoto.jpg', // Path to local image
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Spacer(flex: 1),
            // Instruction Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Press anywhere on the screen to start!",
                textAlign: TextAlign.center,
                style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
              ),
            ),
            Spacer(flex: 2),
            // Skip Button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action for skipping the quiz
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Skip the Quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
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