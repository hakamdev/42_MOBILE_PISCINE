import 'package:calculator_proj/core/calculator_engine.dart';
import 'package:calculator_proj/widgets/calculator_buttons.dart';
import 'package:calculator_proj/widgets/calculator_display.dart';
import 'package:flutter/material.dart';

class CalculatorProjScreen extends StatefulWidget {
  const CalculatorProjScreen({super.key});

  @override
  State<CalculatorProjScreen> createState() => _CalculatorProjScreenState();
}

class _CalculatorProjScreenState extends State<CalculatorProjScreen> {
  CalculatorEngine engine = CalculatorEngine();

  void onDigitPressed(String digit) {
    engine.appendDigit(digit);
  }

  void onSymbolPressed(String symbol) {
    engine.appendOperator(symbol);
  }

  void onCPressed() {
    engine.backspace();
  }

  void onACPressed() {
    engine.clear();
  }

  void onEqualPressed() {
    engine.calculate();
  }

  @override
  void initState() {
    engine.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    engine.dispose();
    super.dispose();
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
            child: CalculatorDisplay(
              valueLiteral: engine.valueLiteral,
              result: engine.result,
            ),
          ),

          // Buttons Area
          Expanded(
            child: CalculatorButtons(
              onDigitPressed: onDigitPressed,
              onOperatorPressed: onSymbolPressed,
              onCPressed: onCPressed,
              onACPressed: onACPressed,
              onEqualPressed: onEqualPressed,
            ),
          ),
        ],
      ),
    );
  }
}
