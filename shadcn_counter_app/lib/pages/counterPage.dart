import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  TextEditingController _textEditingController = TextEditingController();

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
      textColor = Colors.black;
    } else {
      containerColor = const Color.fromRGBO(226, 232, 240, 1);
      textColor = Colors.black;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ShadCard(
                description: Text("Keep track"),
                title: Text('Counter', style: theme.textTheme.h2),
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
                              controller: _textEditingController,
                              placeholder: const Text(
                                'Enter count down number',
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
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                            ),
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
