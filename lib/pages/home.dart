import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String bgImage = "Error";
  Map<String, String> data = {};
  @override
  Widget build(BuildContext context) {
    dynamic agrument = ModalRoute.of(context)?.settings.arguments;
    if (agrument is Map<String, String>) {
      if (data.isEmpty) {
        data = agrument;
      }
    } else {
      print("Date Passed from Loading is Not of Type <String,String>");
      print(agrument.runtimeType);
    }
    if (data["isDayTime"] == "true" || data["isDayTime"] == "false") {
      bool IsDayTime = data["isDayTime"] == "true" ? true : false;
      print(IsDayTime);
      bgImage = IsDayTime ? "Day1.jpg" : "night.jpg";
      print(bgImage);
    } else {
      print("T?F");
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgImage"), fit: BoxFit.cover)),
        child: Center(
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
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data["time"] ?? "Initial Kolkata's Time Not Found",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
