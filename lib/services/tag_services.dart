
import 'dart:convert';
import '../apis/ApiResponse.dart';
import 'package:http/http.dart' as http;
import '../apis/api.dart';
import '../models/Tag.dart';
import '../utills/constants.dart';

class TagServices{
  Future<ApiResponse> getAllTags() async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
        Uri.parse(tagsApi),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Tag.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> getTagsWithMails(List<int> tags) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      if(tags != null) {
        final response = await http.get(
          Uri.parse("$tagWithMailApi$tags"),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        print('Token : ${token}');
        print(response);
        print(response.statusCode);
        switch (response.statusCode) {
          case 200:
            apiResponse.data = Tag.fromJson(jsonDecode(response.body));
            break;
          case 422:
            var errors = jsonDecode(response.body) ['errors'];
            apiResponse.error = errors [errors.keys.elementAt(0)][0];
            break;
          case 403:
            apiResponse.error = jsonDecode(response.body) ['message'];
            break;
          default:
            apiResponse.error = somethingWentWrong;
        }
      }
    }
    catch(e){
      print(e.toString());
      apiResponse.error = serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> getTagsOfMail(int mailId) async{
    ApiResponse apiResponse = ApiResponse();
    try{
        final response = await http.get(
          Uri.parse("$tagOfMailApi$mailId/tags"),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        print('Token : ${token}');
        print(response);
        print(response.statusCode);
        switch (response.statusCode) {
          case 200:
            apiResponse.data = Tag.fromJson(jsonDecode(response.body));
            break;
          case 422:
            var errors = jsonDecode(response.body) ['errors'];
            apiResponse.error = errors [errors.keys.elementAt(0)][0];
            break;
          case 403:
            apiResponse.error = jsonDecode(response.body) ['message'];
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
  Future<ApiResponse> createTag(Tag tag) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
          Uri.parse(tagsApi),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'name' : tag.name,
          });
      print('Token : ${token}');
      print(response);
      print(response.body);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Tag.fromJson(jsonDecode (response.body));
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
}