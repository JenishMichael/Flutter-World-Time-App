import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context)? might return null value, so using null aware operator, -> used to get current scrn
    //settings.arguments -> recieves data from agruments
    //ModalRoute.of(context)?.settings.arguments returns a null object, so we cast it as Map<String, String>?
    Map<String, String>? data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text("Edit Location"),
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data?["flag"] ?? "ERROR In Flag",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data?["location"] ?? "ERROR In location",
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data?["time"] ?? "ERROR In Time",
              style: const TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
