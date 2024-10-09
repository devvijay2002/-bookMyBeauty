import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import '../../shared/kcustom_snackbar.dart';
import '../../util/util.dart';


class BaseAPIService {

  // GET Method
  static Future<dynamic> getRequest({required String apiURL, Map<String,String>? header}) async {
    final url = Uri.parse(apiURL);
    log("This is url :$url");
    try {
      final response = await http.get(
          url,
        headers: header
      ).timeout(const Duration(seconds: 15));
      return handleResponse(response);
    } on SocketException catch (e) {
      KCustomSnackBar(

        message: "Unable to connect to the server. Please check your internet connection.",
        type: 'Network error',
      );
    } on FormatException catch (e) {
      KCustomSnackBar(

        message: "Invalid format received from the server. Please try again later",
        type: 'Data error',
      );
    } on TimeoutException catch (e) {
      KCustomSnackBar(
        message: "The request has timed out. Please try again later.",
        type: 'Timeout error',
      );
    }catch (e) {
      KCustomSnackBar(
        message: Util.returnExceptionMsg(e.toString()),
        type: 'Error',
      );
    }
  }

  // POST Method
  static Future<dynamic> postRequest({ required String apiURL, Map<String, dynamic>? data,Map<String,String>? header}) async {
    final url = Uri.parse(apiURL);
    log("This is url :$url");
    try {
      final response = await http.post(
        url,
        headers: header,
        body: json.encode(data),
      ).timeout(const Duration(seconds: 15));
      return handleResponse(response);
    } on SocketException catch (e) {
      KCustomSnackBar(

        message: "Unable to connect to the server. Please check your internet connection.",
        type: 'Network error',
      );
    } on FormatException catch (e) {
      KCustomSnackBar(
        message: "Invalid format received from the server. Please try again later.",
        type: 'Data error',
      );
    } on TimeoutException catch (e) {
      KCustomSnackBar(
        message: "The request has timed out. Please try again later.",
        type: 'Timeout error',
      );
    } catch (e) {
      KCustomSnackBar(
        message: Util.returnExceptionMsg(e.toString()),
        type: 'Error',
      );
    }
  }

  // PUT Method
  static Future<dynamic> putRequest({required String apiURL,required Map<String, dynamic> data}) async {
    final url = Uri.parse(apiURL);
    log("This is url :$url");
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      ).timeout(const Duration(seconds: 15));
      return handleResponse(response);
    } on SocketException catch (e) {
      KCustomSnackBar(
        message: "Unable to connect to the server. Please check your internet connection.",
        type: 'Network error',
      );
    } on FormatException catch (e) {
      KCustomSnackBar(
        message: "Invalid format received from the server. Please try again later.",
        type: 'Data error',
      );
    }on TimeoutException catch (e) {
      KCustomSnackBar(
        message: "The request has timed out. Please try again later.",
        type: 'Timeout error',
      );
    } catch (e) {
      KCustomSnackBar(
        message: Util.returnExceptionMsg(e.toString()),
        type: 'Error',
      );
    }
  }

  // DELETE Method
  static Future<void> deleteRequest({required String apiURL}) async {
    final url = Uri.parse(apiURL);
    log("This is url :$url");
    try {
      final response = await http.delete(url).timeout(const Duration(seconds: 15));
      return handleResponse(response);
    } on SocketException catch (e) {
      KCustomSnackBar(
        message: "Unable to connect to the server. Please check your internet connection.",
        type: 'Network error',
      );
    } on FormatException catch (e) {
      KCustomSnackBar(
        message: "Invalid format received from the server. Please try again later.",
        type: 'Data error',
      );
    } on TimeoutException catch (e) {
      KCustomSnackBar(
        message: "The request has timed out. Please try again later.",
        type: 'Timeout error',
      );
    }catch (e) {
      KCustomSnackBar(
        message: Util.returnExceptionMsg(e.toString()),
        type: 'Exception',
      );
    }
  }

  // Private method to handle API responses
  static dynamic handleResponse(http.Response response) {
    log("Status Code :${response.statusCode}");
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 404:
        throw Exception('Resource not found');
      case 400:
        throw Exception('Bad request');
        case 409:
        throw Exception(json.decode(response.body)['message'] ?? "Something went wrong" );
      case 500:
      default:
        throw Exception('Server error');
    }
  }
}
