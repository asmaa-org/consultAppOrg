

import 'dart:convert';
import 'dart:html';

import '../apis/ApiResponse.dart';
import '../apis/api.dart';
import '../models/User.dart';
import '../utills/constants.dart';
import 'package:http/http.dart' as http;

class UserServices{
  Future<ApiResponse> register({required String email, required String password, required String confirmPassword,required String name}) async{
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
  Future<ApiResponse> getUserDetail() async {
    ApiResponse apiResponse = ApiResponse();
    try{
      // String token = await getToken();
      final response = await http.get(
          Uri.parse(getSingleUserApi),
          headers: {
            'Accept': 'application/json',
        //    'Authorization': 'Bearer $token',
          },
      );
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
  Future<ApiResponse> updateUser(String name, File? image) async {
    ApiResponse apiResponse = ApiResponse();
    print('in update');
    try {
      // String token = await getToken();
      final response = await http.put(Uri.parse(getSingleUserApi), headers: {
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      }, body: {
        'name': name,
      });
      print(response.body);
      if (response.statusCode == 200) {
        if (image != null) {
          //   await uploadProfileImage(File(image.path));
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
//   Future<int> uploadImage(File file, mailId) async {
//     // String token = await getToken();
//     var request = http.MultipartRequest("POST", Uri.parse(attachmentApi));
// //create multipart using filepath, string or bytes
//     var pic = await http.MultipartFile.fromPath('image', file.path);
//     request.fields['mail_id'] = mailId.toString();
//     request.fields['title'] = 'image_${DateTime.now()}';
// //add multipart to request
//     request.files.add(pic);
//     request.headers
//         .addAll({'Accept': 'application/json', 'Authorization': 'Bearer $token'});
//     var response = await request.send();
//
// //Get the response from the server
//     var responseData = await response.stream.toBytes();
//     var responseString = String.fromCharCodes(responseData);
//     print(responseString);
//     return response.statusCode;
//   }

  }

