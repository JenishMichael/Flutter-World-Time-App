import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Creating an object of WorldTime class and passing the Value
  WorldTime instance =
      WorldTime(location: "Kolkata", url: "Asia/Kolkata", flag: "India");

  //Creating a variable to Initialize Loading
  String time = "Loading>>>";

  @override
  void initState() {
    super.initState();
    //Calling Setup()
    setup();
  }

  Future<void> setup() async {
    //Waiting to complete the getTime()
    await instance.getTime();
    setState(() {
      //Collecting time and displaying it
      time = instance.time ?? "ERROR WHILE COLLECTING TIME";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(time),
    );
  }
}
