// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  final TextEditingController _textEditingController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _setCounterFromInput() {
    setState(() {
      int inputNumber = int.tryParse(_textEditingController.text) ?? 0;
      _counter = inputNumber >= 0 ? inputNumber : 0;
      _textEditingController.clear(); // Clear the input field
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final brightness = Theme.of(context).brightness;

    Color containerColor;
    Color textColor;
    if (brightness == Brightness.dark) {
      containerColor = Colors.white;
      textColor = const Color.fromRGBO(16, 23, 42, 1);
    } else {
      containerColor = const Color.fromRGBO(226, 232, 240, 1);
      textColor = const Color.fromRGBO(16, 23, 42, 1);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ShadCard(
                description: const Text("Keep track"),
                title: Text('Counter ', style: theme.textTheme.h2),
                content: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ShadInput(
                              keyboardType: TextInputType.number,
                              controller: _textEditingController,
                              placeholder: const Text(
                                'Enter count down #️⃣',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          ShadButton(
                            icon: const Icon(
                              Icons.check,
                              size: 15,
                            ),
                            height: 38,
                            onPressed: _setCounterFromInput,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 100,
                        width: 243,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: containerColor,
                        ),
                        child: Center(
                          child: Text(
                            '$_counter',
                            style: theme.textTheme.h2.copyWith(
                                color:
                                    textColor), // Use Shadcn UI h1 text style
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                footer: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadButton(
                        width: 57,
                        height: 57,
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        onPressed: _incrementCounter,
                      ),
                      ShadButton(
                        width: 57,
                        height: 57,
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                        onPressed: _decrementCounter,
                      ),
                      ShadButton.outline(
                        width: 57,
                        height: 57,
                        icon: const Icon(
                          Icons.restart_alt,
                          size: 20,
                        ),
                        onPressed: _resetCounter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CounterPage(),
  ));
}
