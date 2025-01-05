import 'package:flutter/material.dart';
import 'package:mycarmanager_new/add_new_car_page.dart';
import 'package:mycarmanager_new/add_new_expense_page.dart';
import 'package:mycarmanager_new/add_new_reminder_page.dart';
import 'previous_costs_page.dart';
import 'map_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); // Προστέθηκε const στον constructor

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePageContent(),
    const PreviousCostsPage(),
    const Center(child: Text('Placeholder')), // Placeholder
    const MapPage(), // Placeholder
    const SettingsPage(), // Προσθήκη Settings Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Απαλό μωβ background
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            // Ενεργοποίηση popup όταν πατηθεί το "+"
            showAddPopup(context);
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: '',
          ),
        ],
      ),
    );
  }

  void showAddPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildPopupButton(context, 'NEW CAR', Colors.red, () {
                  Navigator.pop(context); // Κλείσιμο popup
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNewCarPage()),
                  );
                }),
                const SizedBox(height: 15),
                buildPopupButton(context, 'NEW EXPENSE', Colors.purple, () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddNewExpensePage()),
                  );
                }),
                const SizedBox(height: 15),
                buildPopupButton(context, 'NEW REMINDER', Colors.green, () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddNewReminderPage()),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPopupButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key}); // Προστέθηκε const στον constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Λογότυπο
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                  image: AssetImage('assets/car_logo.png'), // Βάλε την εικόνα σου
                  fit: BoxFit.cover,
                ),
              ),
              height: 80,
              width: 110,
            ),
          ),
          const SizedBox(height: 20),

          // Tips & Tricks Section
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.lightbulb, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text(
                        'Tips & Tricks',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ecodriving.png', // Εικόνα για Eco Driving
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Eco-Driving:\n- Adaptive cruise control.\n- Tire pressure monitoring.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/safe_driving.png', // Εικόνα για Safe Driving
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Safe Driving:\n- Lane departure warning.\n- Blind spot detection.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Reminders Section
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.notifications, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text(
                        'Reminders',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ListTile(
                    leading:
                        Icon(Icons.local_gas_station, color: Colors.deepPurple),
                    title: Text('Nearby Gas Station'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.build, color: Colors.deepPurple),
                    title: Text('Upcoming Service'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.payment, color: Colors.deepPurple),
                    title: Text('Upcoming Payment for Tires'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
