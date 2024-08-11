import 'package:flutter/material.dart';

class E01screen extends StatefulWidget {
  const E01screen({super.key});

  @override
  State<E01screen> createState() => _E01screenState();
}

class _E01screenState extends State<E01screen> {
  // declare local state variables,
  // can be initialized here, and/or in initState method.
  bool toggle = true;

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
              child: Text(
                // text value will changed based on toggle variable
                toggle ? "A simple text" : "Hello World!",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // call setState and change state variables to
                // see the change reflected on UI.
                // setState will notify the framework that state has changed,
                // and framework will update the affected Widgets, in this case,
                // the Text Widget.
                setState(() {
                  toggle = !toggle;
                });
              },
              child: const Text("Click me"),
            ),
          ],
        ),
      ),
    );
  }
}
