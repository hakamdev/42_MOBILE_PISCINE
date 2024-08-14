import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.label,
    this.onPressed,
    this.foregroundColor,
  });

  final String label;
  final Color? foregroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        // side: BorderSide(
        //     width: 0.2, color: Theme.of(context).colorScheme.inverseSurface),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: foregroundColor ?? Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
