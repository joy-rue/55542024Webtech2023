import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtech_flutter_app/constants.dart';

/// Has a collection of functions that send and retrieve data from database via the implimented API
class ApiService {
//Loads user information from the database using the given id
//Returns the information as a map
  Future<Map<String, dynamic>?>? getUserProfile(String email) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.viewProfile}?email=$email');
      var response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> model = jsonDecode(response.body);

        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// Allows user to alter details in their profile, using post method. Not all fields are mandatory
  Future<Map<String, dynamic>?> editUserProfile(String id,
      {String? name,
      String? email,
      String? dob,
      String? year,
      String? major,
      String? food,
      String? movie,
      String? res}) async {
    try {
      //make post request to the API with the particular endpoint /editprof
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.editProfile}');
      var response = await http.post(url,
          body: jsonEncode(
            <String, dynamic>{
              'name': name,
              'email': email,
              'id': id,
              'dob': dob,
              'year': year,
              'major': major,
              'food': food,
              'movie': movie,
              'res': res
            },
          ));
      if (response.statusCode == 200) {
        Map<String, dynamic> model = jsonDecode(response.body);

        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  /// Create a profile for new user, all fields are required, else input empty strings

  Future<Map<String, dynamic>?> createUserProfile(
      String name,
      String email,
      String id,
      String dob,
      String year,
      String major,
      String food,
      String movie,
      String res) async {
    try {
      //make API call to endpoint /createprof using post and add body
      var url =
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.createProfile}');
      var response = await http.post(url,
          body: jsonEncode(
            <String, dynamic>{
              'name': name,
              'email': email,
              'id': id,
              'dob': dob,
              'year': year,
              'major': major,
              'food': food,
              'movie': movie,
              'res': res
            },
          ));
      if (response.statusCode == 200) {
        Map<String, dynamic> model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ///Create a new post , all given fields re required
  Future<Map<String, dynamic>?> createPost(
      String email, String message, String date, String name) async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.createPost}');
      var response = await http.post(url,
          body: jsonEncode(
            <String, dynamic>{
              'name': name,
              'email': email,
              'message': message,
              'date': date
            },
          ));
      if (response.statusCode == 200) {
        Map<String, dynamic> model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ///Makes API call to load posts from the database
  Future<List<Map<String, dynamic>>?>? viewAllPosts() async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.viewPosts}');
      var response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);
        List<Map<String, dynamic>> model = List<Map<String, dynamic>>.from(
            responseData.map((data) => Map<String, dynamic>.from(data)));

        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
