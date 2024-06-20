import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  final String prediction;

  const PredictionScreen({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    bool isPotable = prediction == '0';
    String resultMessage =
        isPotable ? 'The water is potable!' : 'The water is not potable!';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/predict.webp', // Replace with your image
                    // height: 120,
                    // width: 120,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    ' Prediction:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    resultMessage,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: isPotable ? Colors.green : Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Back to Home'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
