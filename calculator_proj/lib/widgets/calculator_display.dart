import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    required this.valueLiteral,
    required this.result,
  });

  final String valueLiteral;
  final String result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              valueLiteral.isNotEmpty ? valueLiteral : "0",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              result.isNotEmpty ? result : "0",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
