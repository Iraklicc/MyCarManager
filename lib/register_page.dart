import 'package:flutter/material.dart';
import 'package:mycarmanager_new/start_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key}); // Προστέθηκε const

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Επιλεγμένο φύλο
  String? selectedGender;

  // Επιλεγμένο age range
  String? selectedAgeRange;

  // Controllers για τα πεδία κειμένου
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Απαλό μωβ background
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Λογότυπο ή εικόνα
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                image: const DecorationImage(
                  image: AssetImage('assets/car_logo.png'), // Βάλε την εικόνα σου
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
              width: 170,
            ),
                ),
                const SizedBox(height: 20),

                // Full Name Field
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Gender Selection
                const Text(
                  "Gender:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          activeColor: Colors.deepPurple,
                        ),
                        const Text('Male'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          activeColor: Colors.deepPurple,
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Age Range Selection
                const Text(
                  "Age Range:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                Wrap(
                  spacing: 10.0,
                  children: [
                    ChoiceChip(
                      label: const Text('18-25'),
                      selected: selectedAgeRange == '18-25',
                      backgroundColor: Colors.white,
                      onSelected: (selected) {
                        setState(() {
                          selectedAgeRange = '18-25';
                        });
                      },
                      selectedColor: Colors.deepPurple,
                      labelStyle: TextStyle(
                        color: selectedAgeRange == '18-25'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    ChoiceChip(
                      label: const Text('26-45'),
                      selected: selectedAgeRange == '26-45',
                      backgroundColor: Colors.white,
                      onSelected: (selected) {
                        setState(() {
                          selectedAgeRange = '26-45';
                        });
                      },
                      selectedColor: Colors.deepPurple,
                      labelStyle: TextStyle(
                        color: selectedAgeRange == '26-45'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    ChoiceChip(
                      label: const Text('45+'),
                      selected: selectedAgeRange == '45+',
                      backgroundColor: Colors.white,
                      onSelected: (selected) {
                        setState(() {
                          selectedAgeRange = '45+';
                        });
                      },
                      selectedColor: Colors.deepPurple,
                      labelStyle: TextStyle(
                        color: selectedAgeRange == '45+'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Username Field
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Set New Password',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    // Προσθήκη λογικής εγγραφής (π.χ., αποθήκευση τοπικά)
                    if (fullNameController.text.isNotEmpty &&
                        usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        selectedGender != null &&
                        selectedAgeRange != null) {
                      // Επιστροφή στη Login Page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  StartScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
