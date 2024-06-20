import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/solids_screen.dart';
import 'package:water_potability_app/Screens/sulfate_screen.dart';


class ChloraminesInputScreen extends StatefulWidget {
  const ChloraminesInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChloraminesInputScreenState createState() => _ChloraminesInputScreenState();
}

class _ChloraminesInputScreenState extends State<ChloraminesInputScreen> {
  final TextEditingController _chloraminesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Chloramines Level'),
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
                  'assets/images/chloramine.jpeg',
                  // height: 120,
                  // width: 120,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _chloraminesController,
              decoration: const InputDecoration(
                labelText: 'Chloramines',
                hintText: 'Enter chloramines level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter chloramines level';
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
                          builder: (context) => const SolidsInputScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_chloraminesController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SulfateInputScreen(),
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
