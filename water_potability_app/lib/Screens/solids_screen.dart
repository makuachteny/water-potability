import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/chloramines_screen.dart';
import 'package:water_potability_app/Screens/hardness_screen.dart';

class SolidsInputScreen extends StatefulWidget {
  const SolidsInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SolidsInputScreenState createState() => _SolidsInputScreenState();
}

class _SolidsInputScreenState extends State<SolidsInputScreen> {
  final TextEditingController _solidsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Solids (ppm)'),
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
                  'assets/images/solids.jpeg',
                  // height: 120,
                  // width: 120,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _solidsController,
              decoration: const InputDecoration(
                labelText: 'Solids (ppm)',
                hintText: 'Enter solids concentration',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter solids concentration';
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HardnessInputScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_solidsController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChloraminesInputScreen(),
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
