import 'dart:convert';

import 'package:consultApp/models/Role.dart';
import 'package:http/http.dart' as http;

import '../apis/ApiResponse.dart';
import '../apis/api.dart';
import '../utilities/constants.dart';

class RoleServices {
  Future<ApiResponse> getAllRoles() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(
        Uri.parse(rolesApi),
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
          apiResponse.data = Role.fromJson(jsonDecode(response.body));
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
