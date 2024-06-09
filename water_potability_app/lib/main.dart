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
        primarySwatch: Colors.blue,
        hintColor: Colors.lightBlueAccent,
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
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue[700],
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
      home: const PredictionForm(),
    );
  }
}

class PredictionForm extends StatefulWidget {
  const PredictionForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PredictionFormState createState() => _PredictionFormState();
}

class _PredictionFormState extends State<PredictionForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phController = TextEditingController();
  final TextEditingController _hardnessController = TextEditingController();
  final TextEditingController _solidsController = TextEditingController();
  final TextEditingController _chloraminesController = TextEditingController();
  final TextEditingController _sulfateController = TextEditingController();
  final TextEditingController _conductivityController = TextEditingController();
  final TextEditingController _organicCarbonController =
      TextEditingController();
  final TextEditingController _trihalomethanesController =
      TextEditingController();
  final TextEditingController _turbidityController = TextEditingController();

  void _navigateToResultsScreen(String prediction) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(prediction: prediction),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Water Potability Prediction',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _phController,
                  decoration: const InputDecoration(
                    labelText: 'pH Level',
                    hintText: 'e.g. 7.1',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pH level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _hardnessController,
                  decoration: const InputDecoration(
                    labelText: 'Hardness',
                    hintText: 'e.g. 150',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hardness';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _solidsController,
                  decoration: const InputDecoration(
                    labelText: 'Solids (ppm)',
                    hintText: 'e.g. 12000',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter solids concentration';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _chloraminesController,
                  decoration: const InputDecoration(
                    labelText: 'Chloramines',
                    hintText: 'e.g. 6.5',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter chloramines level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _sulfateController,
                  decoration: const InputDecoration(
                    labelText: 'Sulfate',
                    hintText: 'e.g. 200',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter sulfate level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _conductivityController,
                  decoration: const InputDecoration(
                    labelText: 'Conductivity',
                    hintText: 'e.g. 400',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter conductivity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _organicCarbonController,
                  decoration: const InputDecoration(
                    labelText: 'Organic Carbon',
                    hintText: 'e.g. 10',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter organic carbon level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _trihalomethanesController,
                  decoration: const InputDecoration(
                    labelText: 'Trihalomethanes',
                    hintText: 'e.g. 80',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter trihalomethanes level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _turbidityController,
                  decoration: const InputDecoration(
                    labelText: 'Turbidity',
                    hintText: 'e.g. 4.5',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter turbidity level';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Dummy prediction result for now
                      String dummyPrediction = "Water is potable";
                      _navigateToResultsScreen(dummyPrediction);
                    }
                  },
                  child: const Text('Predict'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
