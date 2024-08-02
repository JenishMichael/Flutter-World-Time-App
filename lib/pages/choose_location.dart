import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        backgroundColor: Colors.blue,
      ),
      body: TextButton.icon(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          label: Text("$counter")),
    );
  }
}
