import 'dart:convert';

import 'package:consultApp/models/Category.dart';
import 'package:http/http.dart' as http;

import '../apis/ApiResponse.dart';
import '../apis/api.dart';
import '../utilities/constants.dart';

class CategoryServices {
  Future<ApiResponse> getAllCategory() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(
        Uri.parse(allCategoriesApi),
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
          apiResponse.data = Category.fromJson(jsonDecode(response.body));
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

  Future<ApiResponse> getCategory(int id) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(
        Uri.parse("$singleCategoryApi$id"),
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
          apiResponse.data = Category.fromJson(jsonDecode(response.body));
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

  Future<ApiResponse> createCategory(Category category) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(Uri.parse(mailsApi), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'name': category.name,
      });
      print('Token : ${token}');
      print(response);
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Category.fromJson(jsonDecode(response.body));
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
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
}
