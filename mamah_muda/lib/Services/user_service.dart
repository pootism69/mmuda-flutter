//login
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:mamah_muda/Models/api_response.dart';
import 'package:mamah_muda/Models/users.dart';
import 'package:http/http.dart' as http;
import 'package:mamah_muda/constant.dart';

// Add this function to print the details for debugging
void debugResponse(http.Response response) {
  print('Status Code: ${response.statusCode}');
  print('Body: ${response.body}');
}

Future<void> saveUserDetails(users user) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('name', user.name ?? '');
  await pref.setString('email', user.email ?? '');
}

// Adjusted login function with debug print statements
Future<ApiResponse> login(String name, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'name': name, 'password': password});

    // Debug print statements
    debugResponse(response);

    switch (response.statusCode) {
      case 200:
        users user = users.fromJson(jsonDecode(response.body));
        await saveUserDetails(user); // Save user details to SharedPreferences
        apiResponse.data = user;
        break;
      case 401:
        apiResponse.error = "Username atau Password salah";
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e); // Print the error for debugging
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// Register
Future<ApiResponse> register(String name, String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(
      Uri.parse(registerURL),
      headers: {'Accept': 'application/json'},
      body: {'name': name, 'email': email, 'password': password},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 201:
        users user = users.fromJson(jsonDecode(response.body));
        await saveUserDetails(user); // Save user details to SharedPreferences
        apiResponse.data = user;
        break;
      case 401:
        final errors = jsonDecode(response.body)["errors"];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print('Exception: $e');
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

//user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('id') ?? 0;
}

Future<String> getNameUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('name') ?? '';
}

Future<String> getEmailUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('email') ?? '';
}
