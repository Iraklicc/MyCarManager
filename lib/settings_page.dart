import 'package:flutter/material.dart';
import 'package:mycarmanager_new/login_page.dart';
import 'package:mycarmanager_new/start_screen.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // State για τα switches
  bool isNotificationsEnabled = false;
  bool isServiceRemindersEnabled = false;
  bool isInspectionRemindersEnabled = false;
  bool isNotificationVibrationsEnabled = false;
  bool isAppVibrationsEnabled = false;
  bool isGPSEnabled = false;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Εικόνα χρήστη
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/profile_pic.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Camala White',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Λίστα επιλογών
            Expanded(
              child: ListView(
                children: [
                  buildSettingsOption(
                    context: context,
                    icon: Icons.person,
                    title: 'Edit Profile',
                    onTap: () {},
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () => showCustomDialog(
                      context: context,
                      child: buildNotificationMenu(),
                    ),
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.music_note,
                    title: 'Sounds',
                    onTap: () {},
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.vibration,
                    title: 'Vibrations',
                    onTap: () => showCustomDialog(
                      context: context,
                      child: buildVibrationMenu(),
                    ),
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.privacy_tip,
                    title: 'Privacy',
                    onTap: () => showCustomDialog(
                      context: context,
                      child: buildPrivacyMenu(),
                    ),
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.storage,
                    title: 'Data & Storage',
                    onTap: () {},
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.color_lens,
                    title: 'Change Theme',
                    onTap: () {
                      themeNotifier.toggleTheme();
                    },
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.quiz,
                    title: 'Retake the Quiz',
                    onTap: () => showCustomDialog(
                      context: context,
                      child: buildRetakeQuizMenu(context),
                    ),
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.support,
                    title: 'Support',
                    onTap: () {},
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.group,
                    title: 'Invite Your Friends',
                    onTap: () {},
                  ),
                  buildSettingsOption(
                    context: context,
                    icon: Icons.logout,
                    title: 'Sign Out',
                    onTap: () => showCustomDialog(
                      context: context,
                      child: buildSignOutMenu(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.pink),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }

  void showCustomDialog({required BuildContext context, required Widget child}) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: const EdgeInsets.all(16),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return child;
            },
          ),
        );
      },
    );
  }

  Widget buildNotificationMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSwitchOption(
            'Notifications',
            isNotificationsEnabled,
            (value) {
              setState(() {
                isNotificationsEnabled = value;
              });
            },
          ),
          buildSwitchOption(
            'Service Reminders',
            isServiceRemindersEnabled,
            (value) {
              setState(() {
                isServiceRemindersEnabled = value;
              });
            },
          ),
          buildSwitchOption(
            'Inspection Reminders',
            isInspectionRemindersEnabled,
            (value) {
              setState(() {
                isInspectionRemindersEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text('Save Preferences'),
          ),
        ],
      ),
    );
  }

  Widget buildVibrationMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSwitchOption(
            'Notification Vibrations',
            isNotificationVibrationsEnabled,
            (value) {
              setState(() {
                isNotificationVibrationsEnabled = value;
              });
            },
          ),
          buildSwitchOption(
            'Application Vibrations',
            isAppVibrationsEnabled,
            (value) {
              setState(() {
                isAppVibrationsEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text('Save Preferences'),
          ),
        ],
      ),
    );
  }

  Widget buildPrivacyMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSwitchOption(
            'GPS',
            isGPSEnabled,
            (value) {
              setState(() {
                isGPSEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text('Save Preferences'),
          ),
        ],
      ),
    );
  }

 Widget buildRetakeQuizMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Are you sure you want to Retake the Quiz?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StartScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('No'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSignOutMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Are you sure you want to Sign Out?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('No'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSwitchOption(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
