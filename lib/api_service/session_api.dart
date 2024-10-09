import 'dart:developer';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../constants/api_routes.dart';
import '../local_storage/local_storage.dart';
import '../local_storage/local_storage_keys.dart';
import 'base_api_service/base_api_service.dart';

class SessionAPI{
  static Future<String> getCSRFToken()async{
    try{
      var responseBody = await BaseAPIService.getRequest(
          apiURL: generateCSRFTokenAPI,
          header: {
            'uuid' :'148cfbe9-cca8-4004-84fb-c078cef98893'
          });
      log("responseBody $responseBody");
      if (responseBody['data'] != null) {
        String result = responseBody['data']['csrfToken'];
        return result;
      }
    }catch (e){
      log("error ${e.toString()}");
    }
    return '';
  }

  static Future<String> getSessionToken({required String csrfToken})async{
    try{
      var responseBody = await BaseAPIService.postRequest(
          apiURL: generateSessionTokenAPI,
          header:{
            'token' :csrfToken
          });
      log("responseBody $responseBody");
      if (responseBody['data'] != null) {
        String result = responseBody['data']['sessionToken'];
        return result;
      }
    }catch (e){
      log("error ${e.toString()}");
    }
    return '';
  }

  static Future<String> generateUserSession()async{
    try{
      var csrfToken =await getCSRFToken();
      if(csrfToken.isNotEmpty){
        var userSessionToken = await getSessionToken(csrfToken: csrfToken);
        if(userSessionToken.isNotEmpty){
          await LocalStorage.writeToLocalStorage(key: userSessionKey, value: userSessionToken);
          return userSessionToken;
        }
        return '';
      }
    }catch (e){
      log("error ${e.toString()}");
    }
    return '';
  }



  static Future<void> verifyUserSession() async {
    var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
    if (userSession != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(userSession);
      log("decodedToken $decodedToken");
      // Get the expiration time from the decoded token
      int expirationTime = decodedToken['exp'];
      log("expirationTime $expirationTime");
      // Get the current time in seconds (Unix timestamp)
      int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      log("currentTime $currentTime");
      // Check if the token is expired
      if (expirationTime < currentTime) {
        log("Token is expired");
        await generateUserSession();
      } else {
        log("Token is still valid");
      }
    } else {
      await generateUserSession();

    }
  }

}