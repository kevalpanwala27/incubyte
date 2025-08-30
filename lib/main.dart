import 'package:flutter/material.dart';
import 'string_calculator.dart';

void main() {
  runApp(const StringCalculatorApp());
}

class StringCalculatorApp extends StatelessWidget {
  const StringCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator TDD Kata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StringCalculatorDemo(),
    );
  }
}

class StringCalculatorDemo extends StatefulWidget {
  const StringCalculatorDemo({super.key});

  @override
  State<StringCalculatorDemo> createState() => _StringCalculatorDemoState();
}

class _StringCalculatorDemoState extends State<StringCalculatorDemo> {
  final TextEditingController _inputController = TextEditingController();
  final StringCalculator _calculator = StringCalculator();
  String _result = '';
  String _errorMessage = '';

  void _calculate() {
    setState(() {
      try {
        String input = _inputController.text.trim();
        if (input.startsWith('"') && input.endsWith('"')) {
          input = input.substring(1, input.length - 1);
        }

        final result = _calculator.add(input);
        _result = 'Result: $result';
        _errorMessage = '';
      } catch (e) {
        _result = '';
        _errorMessage = 'Error: $e';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('String Calculator TDD Kata'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'String Calculator Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter a string of numbers to calculate their sum:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g., 1,2,3 or //;\n1;2 or 1\n2,3',
                labelText: 'Input String',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (_errorMessage.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 30),
            const Text(
              'Examples:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildExample('Empty string', '', '0'),
            _buildExample('Single number', '1', '1'),
            _buildExample('Two numbers', '1,5', '6'),
            _buildExample('Multiple numbers', '1,2,3,4,5', '15'),
            _buildExample('New lines', '1\n2,3', '6'),
            _buildExample('Custom delimiter', '//;\n1;2', '3'),
            _buildExample(
              'Negative numbers',
              '-1,2',
              'Error: negative numbers not allowed -1',
            ),
            const SizedBox(height: 20),
            const Text(
              'Try These Inputs:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• 1,2,3 (comma-separated)\n'
              '• 1\\n2,3 (mixed new lines and commas)\n'
              '• //;\\n1;2 (custom semicolon delimiter)\n'
              '• -1,2 (negative numbers - will show error)',
              style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String description, String input, String expected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(description)),
          Expanded(
            flex: 3,
            child: Text(input, style: const TextStyle(fontFamily: 'monospace')),
          ),
          Expanded(
            flex: 2,
            child: Text(
              expected,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
