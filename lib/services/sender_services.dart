
import 'dart:convert';
import '../apis/ApiResponse.dart';
import 'package:http/http.dart' as http;
import '../apis/api.dart';
import '../models/Sender.dart';
import '../utills/constants.dart';

class SenderServices{
  Future<ApiResponse> getAllSenders(bool hasMail) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
        Uri.parse("$senderApi?mail=$hasMail"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Sender.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> getSingleSender(int id,bool hasMail) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
        Uri.parse("$senderApi$id?mail=$hasMail"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Sender.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> createSender(Sender sender) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
          Uri.parse(createSenderApi),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'name' : sender.name,
            'mobile' : sender.mobile,
            'address' : sender.address,
            'category_id' : sender.categoryId,

          });
      print('Token : ${token}');
      print(response);
      print(response.body);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Sender.fromJson(jsonDecode (response.body));
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
      }    }
    catch (e){
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> updateSender(Sender oldSender,String name,mobile,address, int categoryId) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.put(
          Uri.parse("$senderApi${oldSender.id}"),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'name' : name,
            'mobile' : mobile,
            'address' : address,
            'category_id' : categoryId,
          });
      print('Token : ${token}');
      print(response);
      print(response.body);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Sender.fromJson(jsonDecode (response.body));
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
      }    }
    catch (e){
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> deleteSender(int id) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.delete(
        Uri.parse("$senderApi$id"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Sender.fromJson(jsonDecode (response.body));
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