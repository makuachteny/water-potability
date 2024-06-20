import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/turbidity_screen.dart';
import 'package:water_potability_app/Screens/organic_carbon_screen.dart';

class TrihalomethanesInputScreen extends StatefulWidget {
  const TrihalomethanesInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrihalomethanesInputScreenState createState() =>
      _TrihalomethanesInputScreenState();
}

class _TrihalomethanesInputScreenState
    extends State<TrihalomethanesInputScreen> {
  final TextEditingController _trihalomethanesController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Trihalomethanes Level'),
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
                  'assets/images/trihalomethane.png',
                  // height: 300,
                  // width: 400,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _trihalomethanesController,
              decoration: const InputDecoration(
                labelText: 'Trihalomethanes',
                hintText: 'Enter trihalomethanes level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter trihalomethanes level';
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
                          builder: (context) =>
                              const OrganicCarbonInputScreen()),
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_trihalomethanesController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TurbidityInputScreen(),
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
