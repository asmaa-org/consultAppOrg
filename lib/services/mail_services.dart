
import 'dart:io';
import 'dart:convert';
import '../apis/ApiResponse.dart';
import 'package:http/http.dart' as http;
import '../apis/api.dart';
import '../models/Activity.dart';
import '../models/Mail.dart';
import '../models/Tag.dart';
import '../utills/constants.dart';

class MailServices{
  Future<ApiResponse> getAllMails() async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
          Uri.parse(mailsApi),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Mail.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> getMail(int id) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.get(
        Uri.parse("$singleMailApi$id"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Mail.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> createMail(Mail mail, List<File> files) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
        Uri.parse(mailsApi),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
          body: {
            'subject' : mail.subject,
            'description' : mail.description,
            'archive_number' : mail.archiveNumber,
            'decision' : mail.decision,
            'final_decision' : mail.finalDecision,
            'sender_id' : mail.senderId,
            'status_id' : mail.statusId,
            'archive_date' : mail.archiveDate,
          });
      print('Token : ${token}');
      print(response);
      print(response.body);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Mail.fromJson(jsonDecode (response.body));
          if(files != null) {
            for (var file in files) {
              uploadAttachment(mail,file);
            }
          }
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
  Future<ApiResponse> updateMail(Mail mail,int statusId,String decision,finalDecision, List<int> tags, List<Map> activities) async{
    //activities map: [{"body":"any text","user_id" : 1}]
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.put(
          Uri.parse("$singleMailApi${mail.id}"),
          headers: {'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: {
            'decision' : decision,
            'final_decision' : finalDecision,
            'status_id' : statusId,
            'tags' : tags,
            'activities' : activities,
          });
      print('Token : ${token}');
      print(response);
      print(response.body);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Mail.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> deleteMail(int id) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.delete(
        Uri.parse("$singleMailApi$id"),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Mail.fromJson(jsonDecode (response.body));
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
  Future<ApiResponse> storeAttachment(int attachment,int mailId)async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.post(
        Uri.parse(attachmentApi),
        headers: {'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'title' : 'image.${DateTime.now()}' ,
          'image' : attachment,
          'mail_id' : mailId,
        }
      );
      print('Token : ${token}');
      print(response);
      print (response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = Mail.fromJson(jsonDecode (response.body));
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

  Future<int> uploadAttachment(Mail mail, File file) async {
    String api = attachmentApi;
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(api));
    request.fields['mail_id'] = mail.id.toString();
    request.fields['title'] = 'image_${DateTime.now()}';
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return response.statusCode;
  }
}
