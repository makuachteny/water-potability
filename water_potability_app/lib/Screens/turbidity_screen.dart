import 'package:flutter/material.dart';
import 'package:water_potability_app/Screens/trihalomethanes_screen.dart';
import 'package:water_potability_app/prediction_screen.dart';

class TurbidityInputScreen extends StatefulWidget {
  const TurbidityInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TurbidityInputScreenState createState() => _TurbidityInputScreenState();
}

class _TurbidityInputScreenState extends State<TurbidityInputScreen> {
  final TextEditingController _turbidityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Turbidity Level'),
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
                  'assets/images/turbidity.jpg',
                  // height: 120,
                  // width: 120,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _turbidityController,
              decoration: const InputDecoration(
                labelText: 'Turbidity',
                hintText: 'Enter turbidity level',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter turbidity level';
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
                              const TrihalomethanesInputScreen()),
                    );
                  },
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_turbidityController.text.isNotEmpty) {
                      String prediction = _turbidityController
                          .text; // Replace with actual prediction logic
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PredictionScreen(prediction: prediction),
                        ),
                      );
                    }
                  },
                  child: const Text('Save and Predict'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
