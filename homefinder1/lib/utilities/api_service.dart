// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:homefinder1/utilities/services.dart';

class ApiService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._();
  factory ApiService() => _apiUtil;

  final String baseUrl = Services.baseEndPoint;

  Future<dynamic> request<T>(
      String endPoint,
      String method, {
        dynamic data,
        Map<String, String>? headers,
        Function(String errorMsg)? errorDialog,
        Function(String? successMsg)? onSuccess,
        Function(String errorMsg)? errorMessage,
        required BuildContext context,
      }) async {
    try {
      Uri uri = Uri.parse(baseUrl + endPoint);
      HttpClient httpClient = HttpClient();
      HttpClientRequest request;

      if (method == 'GET') {
        request = await httpClient.getUrl(uri);
        request.headers.contentType = ContentType.json;
      } else if (method == 'POST') {
        request = await httpClient.postUrl(uri);
        request.headers.contentType = ContentType.json;
      } else if (method == 'PATCH') {
        request = await httpClient.patchUrl(uri);
        request.headers.contentType = ContentType.json;
      } else if (method == 'DELETE') {
        request = await httpClient.deleteUrl(uri);
        request.headers.contentType = ContentType.json;
      } else {
        throw 'Unsupported HTTP method: $method';
      }

      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.add(key, value);
        });
      }

      // Encode data as JSON and calculate content length
      if (data != null) {
        String jsonData = jsonEncode(data);
        List<int> jsonDataBytes = utf8.encode(jsonData);
        request.headers.contentLength = jsonDataBytes.length;

        // Write JSON data to request body
        request.add(jsonDataBytes);
      }

      HttpClientResponse response = await request.close();

      if (response.statusCode <= 300) {
        String responseBody = await response.transform(utf8.decoder).join();
        if (onSuccess != null) {
          onSuccess(responseBody);
        }
        return json.decode(responseBody);
      } else {
        String errorMessage = await response.transform(utf8.decoder).join();
        throw errorMessage;
      }
    } catch (e, stackTrace) {
      String message = "$e";
      String part = message.substring(28, message.length-2);
      print("Error: $part");
      print("StackTrace: $stackTrace");
      if (errorDialog == null && errorMessage == null) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "Sorry!",
          text: part,
        );
      }
      if (errorDialog != null) {
        errorDialog("Error: $part");
      }
      if (errorMessage != null) {
        errorMessage("Error: $part");
      }
      return null;
    }
  }
}
