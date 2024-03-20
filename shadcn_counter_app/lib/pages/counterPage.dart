// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class counterPage extends StatefulWidget {
  const counterPage({super.key});

  @override
  State<counterPage> createState() => _counterPageState();
}

class _counterPageState extends State<counterPage> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      //color: Colors.white,
      child: Scaffold(
        //backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: ShadCard(
                  //backgroundColor: Colors.black,
                  title: Text('Counter', style: theme.textTheme.h4),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ShadInput(
                                placeholder: Text(
                                  'Enter count down number',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            ShadButton(
                              icon: Icon(
                                Icons.check,
                                size: 15,
                              ),
                              height: 37,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                            height: 100,
                            width: 243,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromRGBO(226, 232, 240, 100),
                            ),
                            child: Center(
                              child: Text(
                                '0',
                                style: ShadTheme.of(context).textTheme.h2,
                              ),
                            )),
                      ],
                    ),
                  ),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadButton(
                        width: 57,
                        height: 57,
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        onPressed: () {
                          print('pressed');
                        },
                      ),
                      ShadButton(
                        width: 57,
                        height: 57,
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                        onPressed: () {
                          print('deployed');
                        },
                      ),
                      ShadButton.outline(
                        width: 57,
                        height: 57,
                        icon: const Icon(
                          Icons.restart_alt,
                          size: 20,
                        ),
                        onPressed: () {
                          print('deployed');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
