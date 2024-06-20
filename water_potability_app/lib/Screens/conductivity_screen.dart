import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/organic_carbon_screen.dart';
import 'package:water_potability_app/Screens/sulfate_screen.dart';

class ConductivityInputScreen extends StatefulWidget {
  const ConductivityInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConductivityInputScreenState createState() =>
      _ConductivityInputScreenState();
}

class _ConductivityInputScreenState extends State<ConductivityInputScreen> {
  final TextEditingController _conductivityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Conductivity Level'),
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
                  'assets/images/conductivity.jpg',
                  // height: 300,
                  // width: 200,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _conductivityController,
              decoration: const InputDecoration(
                labelText: 'Conductivity',
                hintText: 'Enter conductivity level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter conductivity level';
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
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SulfateInputScreen()),
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_conductivityController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OrganicCarbonInputScreen(),
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
