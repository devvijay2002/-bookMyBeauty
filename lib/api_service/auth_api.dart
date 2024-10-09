import 'dart:developer';

import 'package:bookmybeauty/api_service/session_api.dart';
import 'package:bookmybeauty/local_storage/local_storage.dart';
import 'package:bookmybeauty/local_storage/local_storage_keys.dart';
import 'package:bookmybeauty/shared/kcustom_snackbar.dart';
import '../constants/api_routes.dart';
import 'base_api_service/base_api_service.dart';

class AuthAPI {
  static Future<String> registerUser()async{
    try{
      await SessionAPI.verifyUserSession();
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      if(userSession !=null){
        var responseBody = await BaseAPIService.postRequest(
            apiURL: registerUserAPI,
            header:{
              "session_token" :userSession,
              "Content-Type": "application/json"},
            data: {
              "name": "Raushan Raj",
              "email": "abymemp93@gmail.com",
              "mobile": "9898909098",
              "gender": 0,
              "password": "Raushan@12"
            }
        );
        log("responseBody $responseBody");
        if (responseBody['data'] != null) {
          String result = responseBody['data']['sessionToken'];
          return result;
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
    return '';
  }



}