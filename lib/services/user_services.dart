

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:async';
import '../apis/ApiResponse.dart';
import '../apis/api.dart';
import '../models/User.dart';
import '../utills/constants.dart';
import 'package:http/http.dart' as http;

class UserServices{
  String? token;
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future<ApiResponse> register({required String email, required String password,required String name}) async{
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
          Uri.parse(registerApi),
          headers: {'Accept': 'application/json',},
          body: {'name': name,email: email,'password': password,'password_confirmation': password,}
      );
      print (response.statusCode);
      print (response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> login(String email,password) async{
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
        Uri.parse(loginApi),
        headers: {'Accept': 'application/json',},
        body: {'email': email, 'password': password},);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 422:
          {
            final errors = jsonDecode(response.body) ['errors'];
            apiResponse.error = errors [errors.keys.elementAt(0)][0];
          }
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    }
    catch(e){
      print('user services: ${e.toString()}');
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> createUser(User user,int password) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
        Uri.parse(usersApi),
        headers: {'Accept': 'application/json',},
        body: {
          'name': user.name,
          'email' : user.email,
          'role_id': user.roleId,
          'password': password,
          'password_confirmation' : password
        },);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 422:
          {
            final errors = jsonDecode(response.body) ['errors'];
            apiResponse.error = errors [errors.keys.elementAt(0)][0];
          }
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    }
    catch (e){
      print('user services: ${e.toString()}');
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> getAllUser() async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
        Uri.parse(usersApi),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> getSingleUser(int id) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
        Uri.parse("$getSingleUserApi$id"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> getUserDetail() async {
    ApiResponse apiResponse = ApiResponse();
    try{
      token = await getToken();
      final response = await http.get(
          Uri.parse(getSingleUserApi),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
      );
      print('Token : ${token}');
      print(response);
           switch (response.statusCode) {
            case 200:
              apiResponse.data = User.fromJson(jsonDecode (response.body)).token;
              setToken(token.toString());
              break;
            case 422:
              final errors = jsonDecode (response.body) ['errors'];
              apiResponse.error = errors [errors.keys.elementAt(0)][0];
              break;
            case 403:
              apiResponse.error = jsonDecode (response.body) ['message'];
              break;
            case 500:
              apiResponse.error = jsonDecode (response.body) ['message'];
              break;
            default:
              apiResponse.error = somethingWentWrong;
          }
    }
    catch (e) {
    apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> updateUser(String name,User user, File? image) async {
    ApiResponse apiResponse = ApiResponse();
    print('in update');
    try {
      token = await getToken();
      final response = await http.put(Uri.parse("$updateUserApi${user.id}?name=$name"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      if (response.statusCode == 200) {
        if (image != null) {
          await uploadProfileImage(name, File(image.path));
          print('in upload profile');
        }
      }
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          final errors = jsonDecode (response.body) ['errors']; apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        case 500:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
    }
  Future<int> uploadProfileImage(String userName, File file) async {
    String api = updateUserApi;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(api));
    request.fields['name'] = userName;
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return response.statusCode;
  }
  Future<ApiResponse> changePassword(int id,String password) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
        Uri.parse("$changePasswordUserApi$id/password"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'password': password,
          'password_confirmation' : password
        }
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> changeRole(int userId,int roleId) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.put(
        Uri.parse("$changeRoleApi$userId/role"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'role_id': roleId
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> deleteUser(int id) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.delete(
        Uri.parse("$getSingleUserApi$id"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> logoutUser() async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
        Uri.parse(logoutApi),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode (response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body) ['errors'];
          apiResponse.error = errors [errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode (response.body) ['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }


  }

