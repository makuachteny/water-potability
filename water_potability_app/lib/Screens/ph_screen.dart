import 'package:flutter/material.dart';
import 'package:water_potability_app/Home_page.dart';
import 'hardness_screen.dart';

class PHInputScreen extends StatefulWidget {
  const PHInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PHInputScreenState createState() => _PHInputScreenState();
}

class _PHInputScreenState extends State<PHInputScreen> {
  final TextEditingController _phController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter pH Level'),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/pH.jpg',
                  // height: 50,
                  // width: 200,
                  fit: BoxFit.cover, // Adjust this as needed
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _phController,
              decoration: const InputDecoration(
                labelText: 'pH Level',
                hintText: 'Enter pH level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter pH level';
                }
                return null;
              },
            ),
               const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const IntroductionScreen()),
                      (route) => false);
                  },
                  child: const Text('Back'),
                ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (_phController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HardnessInputScreen(),
                    ),
                  );
                }
              },
              child: const Text('Next'),
          ),
         ],
        ),
       ],
      ),
    ),
  );
  }
}
