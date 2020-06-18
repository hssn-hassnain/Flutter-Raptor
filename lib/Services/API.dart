import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  return Scaffold();
}

//=> SignIn method
Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
};

Future<int> signIn(String email, password, deviceId) async {
  final data = jsonEncode({
    "email": email,
    "password": password,
  });
  var response = await post(
    "Your-Login-API",
    headers: headers,
    body: data,
  );
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    sharedPreferences.setString("Bearer token", jsonResponse['token']);
    print(jsonResponse);
    return 200;
  } else {
    print(jsonResponse);
    return 422;
  }
}

Future<int> regIndividual(String email, password,mobile,secondaryMobile,name,image) async {
  final data = jsonEncode({
  "email": email,
  "password": password,
  "mobile": mobile,
  "secondaryMobile": secondaryMobile,
  "name": name,
  "image": image
  });
  var response = await post(
    "Your-Registration-Server-API",
    headers: headers,
    body: data,
  );
  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    print(jsonResponse);
    return 200;
  } else {
    print(jsonResponse);
    return 422;
  }
}