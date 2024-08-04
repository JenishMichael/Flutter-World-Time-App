import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  WorldTime instance =
      WorldTime(location: "Kolkata", url: "Asia/Kolkata", flag: "India");

  @override
  void initState() {
    super.initState();
    //Calling setup() method
    setup();
  }

  Future<void> setup() async {
    //Will wait for getTIme to complete and assign the time to time property

    await instance.getTime();
    await Future.delayed(Duration(seconds: 3));

    //Now we pass the details to next scrn by adding map parameter
    Navigator.pushReplacementNamed(context, "/home",
        arguments: <String, String>{
          "location": instance.location,
          "time": instance.time ?? "ERROR TIME NOT FOUND",
          "flag": instance.flag,
          "isDayTime": (instance.isDayTime).toString(),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: const Center(
          child: SpinKitCircle(
        color: Colors.white,
        size: 50,
      )),
    );
  }
}
