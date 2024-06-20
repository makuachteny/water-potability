import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/solids_screen.dart';
import 'package:water_potability_app/Screens/ph_screen.dart';

class HardnessInputScreen extends StatefulWidget {
  const HardnessInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HardnessInputScreenState createState() => _HardnessInputScreenState();
}

class _HardnessInputScreenState extends State<HardnessInputScreen> {
  final TextEditingController _hardnessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Hardness'),
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
                  'assets/images/hardness.jpg',
                  // height: 200, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _hardnessController,
              decoration: const InputDecoration(
                labelText: 'Hardness',
                hintText: 'Enter hardness level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter hardness level';
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
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_hardnessController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SolidsInputScreen(),
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
