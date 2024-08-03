import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String flag;
  String location;
  String? time;

  //Named Parameter Constructor
  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map<String, dynamic> resMap = jsonDecode(response.body);

      //Getting Date & Time From response And Converting it to DatTime Type
      String datetimeStr = resMap["datetime"] ?? "Error";
      DateTime dateTime = DateTime.parse(datetimeStr);

      //Getting utc_offset from resMap
      String offsetStr = resMap["utc_offset"] ?? "Error";
      String offsetSign = offsetStr.substring(0, 1);
      int offsetHr = int.parse(offsetStr.substring(1, 3));
      int offsetMin = int.parse(offsetStr.substring(4, 6));

      //Check the sign and Add or Sub the offset time to datetime
      if (offsetSign == "+") {
        dateTime = dateTime.add(Duration(hours: offsetHr, minutes: offsetMin));
      } else {
        dateTime =
            dateTime.subtract(Duration(hours: offsetHr, minutes: offsetMin));
      }

      //Converting datetime to String and assigning it to time property
      time = DateFormat.jm().format(dateTime);
    } catch (e) {
      time = "Error";
      print("Error: $e");
    }
  }
}
