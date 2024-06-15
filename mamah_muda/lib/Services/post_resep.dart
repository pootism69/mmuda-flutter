import 'dart:convert';

import 'package:mamah_muda/Models/resep.dart';
import 'package:mamah_muda/Services/user_service.dart';
import 'package:mamah_muda/Models/api_response.dart';
import 'package:mamah_muda/constant.dart';
import 'package:mamah_muda/Services/user_service.dart';
import 'package:http/http.dart' as http;

//get all post
Future<ApiResponse> getPosts() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(userResep),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Get Posts Status Code: ${response.statusCode}');
    print('Get Posts Response Body: ${response.body}');

    switch (response.statusCode) {
      case 200:
        final jsonData = jsonDecode(response.body)['posts'];
        List<PostResep> posts = [];

        for (var jsonPost in jsonData) {
          posts.add(PostResep.fromJson(jsonPost));
        }

        apiResponse.data = posts;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        print('Error: ${response.statusCode} ${response.body}');
    }
  } catch (e) {
    apiResponse.error = serverError;
    print('Exception during GET request: $e');
  }
  return apiResponse;
}

//post resep
Future<ApiResponse> createPosts(
  String title,
  String description,
  String timeToCook,
  String tingkat,
  String category,
  String tahun,
  String origin,
  String ingredient,
  String instruction,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    int userId = await getUserId();
    final response = await http.post(
      Uri.parse(buatResepURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': title,
        'userId': userId,
        'description': description,
        'waktu': timeToCook,
        'tingkat': tingkat,
        'category': category,
        'tahun': tahun,
        'origin': origin,
        'bahan': ingredient,
        'instruction': instruction,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 200:
      case 201:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        print('Error: ${response.statusCode} ${response.body}');
    }
  } catch (e) {
    apiResponse.error = serverError;
    print('Exception: $e');
  }
  return apiResponse;
}

//delete post

Future<ApiResponse> deletePosts(
  int recipeId,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response =
        await http.delete(Uri.parse('$buatResepURL/$recipeId'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 201:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
