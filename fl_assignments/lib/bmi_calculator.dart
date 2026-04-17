import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  
  double? _bmiResult;
  String _bmiStatus = '';

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      // BMI formula: weight (kg) / [height (m)]^2
      setState(() {
        _bmiResult = weight / ((height / 100) * (height / 100)); // Assuming height in cm
        if (_bmiResult! < 18.5) {
          _bmiStatus = 'Underweight';
        } else if (_bmiResult! >= 18.5 && _bmiResult! <= 24.9) {
          _bmiStatus = 'Normal';
        } else if (_bmiResult! >= 25 && _bmiResult! <= 29.9) {
          _bmiStatus = 'Overweight';
        } else {
          _bmiStatus = 'Obese';
        }
      });
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight in kg',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monitor_weight),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height in cm',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.height),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('CALCULATE'),
            ),
            const SizedBox(height: 40),
            if (_bmiResult != null)
              Column(
                children: [
                  Text(
                    'Your BMI: ${_bmiResult!.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Status: $_bmiStatus',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _bmiStatus == 'Normal' ? Colors.green : Colors.redAccent,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
