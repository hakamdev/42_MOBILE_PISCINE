import 'package:ex02/calculator_button.dart';
import 'package:flutter/material.dart';

class Ex02Screen extends StatefulWidget {
  const Ex02Screen({super.key});

  @override
  State<Ex02Screen> createState() => _Ex02ScreenState();
}

class _Ex02ScreenState extends State<Ex02Screen> {
  void onButtonPressed(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Display Area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onInverseSurface,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onInverseSurface,
                        ),
                  ),
                ],
              ),
            ),
          ),

          // Buttons Area
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CalculatorButton(
                            label: "7",
                            onPressed: () => onButtonPressed("7"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "8",
                            onPressed: () => onButtonPressed("8"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "9",
                            onPressed: () => onButtonPressed("9"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "C",
                            foregroundColor: Colors.red,
                            onPressed: () => onButtonPressed("C"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "AC",
                            foregroundColor: Colors.red,
                            onPressed: () => onButtonPressed("AC"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CalculatorButton(
                            label: "4",
                            onPressed: () => onButtonPressed("4"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "5",
                            onPressed: () => onButtonPressed("5"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "6",
                            onPressed: () => onButtonPressed("6"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "+",
                            foregroundColor:
                                Theme.of(context).colorScheme.surface,
                            onPressed: () => onButtonPressed("+"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "-",
                            foregroundColor:
                                Theme.of(context).colorScheme.surface,
                            onPressed: () => onButtonPressed("-"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CalculatorButton(
                            label: "1",
                            onPressed: () => onButtonPressed("1"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "2",
                            onPressed: () => onButtonPressed("2"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "3",
                            onPressed: () => onButtonPressed("3"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "x",
                            foregroundColor:
                                Theme.of(context).colorScheme.surface,
                            onPressed: () => onButtonPressed("x"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "/",
                            foregroundColor:
                                Theme.of(context).colorScheme.surface,
                            onPressed: () => onButtonPressed("/"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: CalculatorButton(
                            label: "0",
                            onPressed: () => onButtonPressed("0"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: ".",
                            onPressed: () => onButtonPressed("."),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "00",
                            onPressed: () => onButtonPressed("00"),
                          ),
                        ),
                        Expanded(
                          child: CalculatorButton(
                            label: "=",
                            foregroundColor:
                                Theme.of(context).colorScheme.surface,
                            onPressed: () => onButtonPressed("="),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
