import 'dart:convert';

import 'package:consultApp/models/Status.dart';
import 'package:consultApp/services/user_services.dart';
import 'package:http/http.dart' as http;

import '../apis/ApiResponse.dart';
import '../apis/api.dart';
import '../utilities/constants.dart';

class StatusServices {
  String? token ;
  void setMyToken(){
    UserServices userServices = UserServices();
    token =  userServices.getToken() as String;
  }
  Future<ApiResponse> getAllStatuses() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(
        Uri.parse(allStatusesApi),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Status.fromJson(jsonDecode(response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    } catch (e) {
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<ApiResponse> getStatus(int id) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(
        Uri.parse("$singleStatusApi$id"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Status.fromJson(jsonDecode(response.body));
          break;
        case 422:
          var errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        default:
          apiResponse.error = somethingWentWrong;
      }
    } catch (e) {
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
}
