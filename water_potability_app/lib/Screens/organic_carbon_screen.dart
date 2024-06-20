import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/trihalomethanes_screen.dart';
import 'package:water_potability_app/Screens/conductivity_screen.dart';

class OrganicCarbonInputScreen extends StatefulWidget {
  const OrganicCarbonInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrganicCarbonInputScreenState createState() =>
      _OrganicCarbonInputScreenState();
}

class _OrganicCarbonInputScreenState extends State<OrganicCarbonInputScreen> {
  final TextEditingController _organicCarbonController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Organic Carbon Level'),
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
                  'assets/images/organic_carbon.webp',
                  // height: 120,
                  // width: 120,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _organicCarbonController,
              decoration: const InputDecoration(
                labelText: 'Organic Carbon',
                hintText: 'Enter organic carbon level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter organic carbon level';
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
                              const ConductivityInputScreen()),
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_organicCarbonController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const TrihalomethanesInputScreen(),
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
