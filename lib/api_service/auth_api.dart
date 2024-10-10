import 'dart:developer';
import 'package:bookmybeauty/api_service/session_api.dart';
import 'package:bookmybeauty/local_storage/local_storage.dart';
import 'package:bookmybeauty/local_storage/local_storage_keys.dart';
import 'package:bookmybeauty/shared/kcustom_snackbar.dart';
import '../constants/api_routes.dart';
import 'base_api_service/base_api_service.dart';

class AuthAPI {
  static Future<void> registerUser({required Map<String, dynamic> data})async{
    try{
      log("data $data");
      await SessionAPI.verifyUserSession();
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      if(userSession !=null){
        var responseBody = await BaseAPIService.postRequest(
            apiURL: registerUserAPI,
            header:{
              "session_token" :userSession,
              'Content-Type': 'application/json'
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

  static Future<void> login({required Map<String, dynamic> data})async{
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
              'Content-Type': 'application/json'
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
              'Content-Type': 'application/json'
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
              'Content-Type': 'application/json'
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
              'Content-Type': 'application/json'
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