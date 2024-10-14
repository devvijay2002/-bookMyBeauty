import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bookmybeauty/api_service/session_api.dart';
import 'package:bookmybeauty/local_storage/local_storage.dart';
import 'package:bookmybeauty/local_storage/local_storage_keys.dart';
import 'package:bookmybeauty/shared/kcustom_snackbar.dart';
import '../constants/api_routes.dart';
import 'base_api_service/base_api_service.dart';
import 'package:http/http.dart' as http;
class AuthAPI {
  static Future<bool> registerUser({required Map<String, String> data,required String imagePath})async{
    await SessionAPI.verifyUserSession();
    log("data $data");
    log("imagePath $imagePath");
    log("readFromLocalStorage");
    var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
    var headers = {
      'session_token': userSession!
    };
    File imageFile = File(imagePath);
    if (!imageFile.existsSync()) {
      log("Image file does not exist");
      return false;
    }
    var request = http.MultipartRequest('POST', Uri.parse('http://15.207.172.209:5000/api/v1/user/register'));
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromPath('profile_image', imagePath,));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseString = await response.stream.bytesToString();
    log("Raw Response: $responseString");
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }
/*  static Future<String?> uploadMediaFile({required String imagePath}) async {

    try {
      var url = Uri.parse("https://sfa-api.lalpathlabs.com/api/v1/UserAuth/uploadMediaSingle");
      var headers = {
        ...acceptHeader,
        'Access-Token': "k7eo9o7GSEnbT2X4QEByWK+7s4hcYETfZVGs578DgjxCjh12DnNUH4gwbrub4X4BlqCbivmI8lTT6tXTdYOECiDrGOfSXggcvhxxFjtxwNjzw7VtCgpa6I1BLCDvlvTSJ8xk2dWjCIeG79d3On7veI5HAa6vEzf9I2Cs5TQyJ5yTSeoUgtz9+mYAvGO6hOC1h37+p5M2RUAkdWdQ6lHvCNGANX2DVaqPqr12pMFT6MvK7Os7cz6oTqpq2HseMQ//iMxUu02H2N3Nl5Gf5zt3hBFdFBlcvUgnE9rBC68gmTT5Bxoumjbog/tFIT5uYe8tTqCSXOJbOV2iaG0dQYdqtA==",
      };
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('file', imagePath));
      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(await response.stream.bytesToString());
        log('Upload Image URL => ${responseBody['data']['url']}');
        return '${responseBody['data']['url']}';
      } else {
        log('Error uploading image ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error uploading image $e');
      return null;
    }
    return null;
  }*/
/* static Future<bool> registerUser({required Map<String, String> data,required String imagePath})async{
    try{

      await SessionAPI.verifyUserSession();
      log("data $data");
      log("imagePath $imagePath");
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      if(userSession !=null){
        var responseBody =await BaseAPIService.postWithImageRequest(
            apiURL: registerUserAPI,
            header:{
            "session_token" :userSession,
              },
            imagePath: imagePath,
            data: data);
        log("responseBody $responseBody");
        if(responseBody !=null){
          return true;
        }
      }else{
        KCustomSnackBar(
          type: 'error',
          message: "Session has been expired"
        );
      }
    }catch (e){
      log("error ${e.toString()}");
    }
    return false;
  }
*/
  static Future<bool> login({required Map<String, dynamic> data})async{
    try{

      await SessionAPI.verifyUserSession();
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      log("data: $data");
      if(userSession !=null){
        var responseBody = await BaseAPIService.postRequest(
            apiURL: loginUserAPI,
            header:{
              "session_token" :userSession,
              ...applicationJsonHeader
              },
            data: data
        );
        log("responseBody $responseBody");
        if(responseBody !=null){
          return true;
        }
      }else{
        KCustomSnackBar(
          type: 'error',
          message: "Session has been expired"
        );
      }
    }catch (e){
      log("error ${e.toString()}");
    }
    return false;
  }


  static Future<void> forgotPassword({required Map<String, dynamic> data})async{
    try{

      await SessionAPI.verifyUserSession();
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      log("data: $data");
      if(userSession !=null){
        var responseBody = await BaseAPIService.postRequest(
            apiURL: forgotPasswordAPI,
            header:{
              "session_token" :userSession,
              ...applicationJsonHeader
            },
            data: data
        );
        log("responseBody $responseBody");
      }else{
        KCustomSnackBar(
            type: 'error',
            message: "Session has been expired"
        );
      }
    }catch (e){
      log("error ${e.toString()}");
    }
  }
  static Future<void> verifyOTP({required Map<String, dynamic> data})async{
    try{

      await SessionAPI.verifyUserSession();
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      log("data: $data");
      if(userSession !=null){
        var responseBody = await BaseAPIService.postRequest(
            apiURL: verifyOtpAPI,
            header:{
              "session_token" :userSession,
              ...applicationJsonHeader
              },
            data: data
        );
        log("responseBody $responseBody");
      }else{
        KCustomSnackBar(
          type: 'error',
          message: "Session has been expired"
        );
      }
    }catch (e){
      log("error ${e.toString()}");
    }
  }
  static Future<void> resetPassword({required Map<String, dynamic> data})async{
    try{
      await SessionAPI.verifyUserSession();
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      log("data: $data");
      if(userSession !=null){
        var responseBody = await BaseAPIService.postRequest(
            apiURL: resetPasswordAPI,
            header:{
              "session_token" :userSession,
              ...applicationJsonHeader
              },
            data: data
        );
        log("responseBody $responseBody");
      }else{
        KCustomSnackBar(
          type: 'error',
          message: "Session has been expired"
        );
      }
    }catch (e){
      log("error ${e.toString()}");
    }
  }
}