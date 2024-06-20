import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/chloramines_screen.dart';
import 'package:water_potability_app/Screens/conductivity_screen.dart';


class SulfateInputScreen extends StatefulWidget {
  const SulfateInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SulfateInputScreenState createState() => _SulfateInputScreenState();
}

class _SulfateInputScreenState extends State<SulfateInputScreen> {
  final TextEditingController _sulfateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Sulfate Level'),
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
                  'assets/images/sulfate.jpg',
                  // height: 500,
                  // width: 120,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _sulfateController,
              decoration: const InputDecoration(
                labelText: 'Sulfate',
                hintText: 'Enter sulfate level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter sulfate level';
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
                          builder: (context) => const ChloraminesInputScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_sulfateController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConductivityInputScreen(),
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
