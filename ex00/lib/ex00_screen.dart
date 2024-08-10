import 'package:flutter/material.dart';

class Ex00Screen extends StatelessWidget {
  const Ex00Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green.shade800,
                  borderRadius: BorderRadius.circular(8)),
              child: const Text(
                "Hello World!",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                print("Button pressed");
              },
              child: const Text("Click me"),
            ),
          ],
        ),
      ),
    );
  }
}
