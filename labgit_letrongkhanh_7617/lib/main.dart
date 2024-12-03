import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  String result = "";

  void _calculate(String operation) {
    double num1 = double.tryParse(number1Controller.text) ?? 0;
    double num2 = double.tryParse(number2Controller.text) ?? 0;

    setState(() {
      if (operation == '+') {
        result = (num1 + num2).toString();
      } else if (operation == '-') {
        result = (num1 - num2).toString();
      } else if (operation == 'x') {
        result = (num1 * num2).toString();
      } else if (operation == ':') {
        if (num2 != 0) {
          result = (num1 / num2).toString();
        } else {
          result = "Error: Division by 0";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Number 1'),
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Number 1',
              ),
            ),
            SizedBox(height: 20),
            Text('Number 2'),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Number 2',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('x'),
                  child: const Text('x'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate(':'),
                  child: const Text(':'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
