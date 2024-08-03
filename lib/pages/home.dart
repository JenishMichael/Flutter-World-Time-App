import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> data = {};
  @override
  Widget build(BuildContext context) {
    dynamic agrument = ModalRoute.of(context)?.settings.arguments;
    if (agrument is Map<String, String> && data.isEmpty) {
      //Is This condition right
      data = agrument;
    } else {
      print("Date Passed from Loading is Not of Type <String,String>");
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 120, 50, 0),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  print(result);

                  if (result is Map<String, String>) {
                    setState(() {
                      data = result;
                    });
                  } else {
                    print(
                        "Date Recieved from location is Not of Type <String,String>");
                    print(result.runtimeType);
                  }
                },
                label: const Text("Choose Other Location"),
                icon: const Icon(
                  Icons.edit,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data["location"] ?? "Initial Location Kolkata Not Found",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data["time"] ?? "Initial Kolkata's Time Not Found",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
