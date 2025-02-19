import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends ChangeNotifier {
  var _appBarItems = {
    "Home" : Icons.home,
    "Create Scam" : Icons.add,
    "Contact Us" : Icons.message_outlined,
    "About Us" : Icons.corporate_fare_outlined,
};

  Map<String, IconData> get getappBarItems {
    return {..._appBarItems};
  }

  static const address = String.fromEnvironment("ADDRESS");
  // static const address = "http://localhost:3000";

  Future<void> sendData(toSend) async {
    print(toSend);
    Map<String, String> instanceToSend = {...toSend};
    print(instanceToSend);
    final url = Uri.parse("$address/scam");
    var request = await http.post(
      url,
      body: instanceToSend,
      encoding: Encoding.getByName('utf-8'),
    );
    print(request);
  }

  Future<String> sendLocation(loc) async {
    print(loc);
    final location = {'location': loc};
    final url = Uri.parse("$address/");
    final request = await http.post(
      url,
      body: location,
      encoding: Encoding.getByName('utf-8'),
    );
    return request.body;
  }

  Future<String> sendCoordinates(loc) async {
    print(loc);
    final location = {'location': jsonEncode(loc)};
    print("Location Sent in the format: \n$location");
    final url = Uri.parse("$address/");
    final request = await http.post(
      url,
      body: location,
      encoding: Encoding.getByName('utf-8'),
    );
    return request.body;
  }

}
