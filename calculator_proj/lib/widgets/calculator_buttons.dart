import 'package:calculator_proj/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons({
    super.key,
    required this.onDigitPressed,
    required this.onOperatorPressed,
    required this.onCPressed,
    required this.onACPressed,
    required this.onEqualPressed,
  });

  final void Function(String) onDigitPressed;
  final void Function(String) onOperatorPressed;
  final VoidCallback onCPressed;
  final VoidCallback onACPressed;
  final VoidCallback onEqualPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: () => onDigitPressed("7"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "8",
                    onPressed: () => onDigitPressed("8"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "9",
                    onPressed: () => onDigitPressed("9"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "C",
                    foregroundColor: Colors.red,
                    onPressed: () => onCPressed(),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "AC",
                    foregroundColor: Colors.red,
                    onPressed: () => onACPressed(),
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
                    onPressed: () => onDigitPressed("4"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "5",
                    onPressed: () => onDigitPressed("5"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "6",
                    onPressed: () => onDigitPressed("6"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "+",
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () => onOperatorPressed("+"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "-",
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () => onOperatorPressed("-"),
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
                    onPressed: () => onDigitPressed("1"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "2",
                    onPressed: () => onDigitPressed("2"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "3",
                    onPressed: () => onDigitPressed("3"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "x",
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () => onOperatorPressed("x"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "/",
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () => onOperatorPressed("/"),
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
                    onPressed: () => onDigitPressed("0"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: ".",
                    onPressed: () => onDigitPressed("."),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "00",
                    onPressed: () => onDigitPressed("00"),
                  ),
                ),
                Expanded(
                  child: CalculatorButton(
                    label: "=",
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    onPressed: () => onEqualPressed(),
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
    );
  }
}
