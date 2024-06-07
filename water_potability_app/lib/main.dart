// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'results_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Potability Prediction',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.lightBlue[50],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue[700],
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.lightBlueAccent),
      ),
      // ignore: prefer_const_constructors
      home: PredictionForm(),
    );
  }
}

class PredictionForm extends StatefulWidget {
  const PredictionForm({super.key});

  @override
  _PredictionFormState createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _featuresController = TextEditingController();

  void _navigateToResultsScreen(String prediction) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsScreen(prediction: prediction)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Potability Prediction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _featuresController,
                decoration: const InputDecoration(
                  labelText: 'Enter features separated by commas',
                  hintText: 'e.g. 7.1,3.4,5.6,2.1',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some features';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call the api here
                    _navigateToResultsScreen("Dummy Prediction Result");
                  }
                },
                child: const Text('Predict'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
