import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "London", url: "Europe/London", flag: "UK.png"),
    WorldTime(
        location: "New York", url: "America/New_York", flag: "America.png"),
    WorldTime(
        location: "Los Angeles",
        url: "America/Los_Angeles",
        flag: "America.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select The Region"),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image(
                    image: AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
                title: Text(locations[index].location),
                onTap: () async {
                  WorldTime instance = locations[index];
                  await instance.getTime();

                  Navigator.pop(context, <String, String>{
                    "location": instance.location,
                    "time": instance.time ?? "Region Time Not Found",
                  });
                  print("data passed from location");
                },
              ),
            );
          }),
    );
  }
}
