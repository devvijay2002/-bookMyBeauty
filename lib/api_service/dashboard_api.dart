import 'dart:developer';

import 'package:bookmybeauty/api_service/base_api_service/base_api_service.dart';
import 'package:bookmybeauty/api_service/session_api.dart';
import 'package:bookmybeauty/model/dashboard_model.dart';

import '../constants/api_routes.dart';
import '../local_storage/local_storage.dart';
import '../local_storage/local_storage_keys.dart';

class DashboardAPI {


  static Future<DashboardModel?> getDashboardData({required Map<String,dynamic> data})async{
    try{
      await SessionAPI.verifyUserSession();
      log("data $data");
      log("readFromLocalStorage");
      var userSession = await LocalStorage.readFromLocalStorage(key: userSessionKey);
      var responseBody = await BaseAPIService.postRequest(
        apiURL: dashboardAPI,
        header: {
            'session_token':userSession!,
            ...applicationJsonHeader
        },
        data: data
      );
     if(responseBody !=null && responseBody["data"] !=null){
       var result = responseBody["data"];
       return DashboardModel.fromJson(result);
     }
    }catch(e){
      log("Error getDashboardData: ${e.toString()}");
    }
    return null;
  }


}