import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:getx_mvvm_architecture/data/app_exceptions.dart';
import 'package:getx_mvvm_architecture/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  ///for get api
  @override
  Future<dynamic> getApi({required String url}) async {
    log("API URL: $url");
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response: response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }

    return responseJson;
  }

  ///for post api
  @override
  Future<dynamic> postApi({required var data, required String url}) async {
    log("API URL: $url");
    log("Data: $data");
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),

            ///for raw data-> you have to use jsonEncode(data)
            ///for form data-> you don't need to use jsonEncode(data)
            body: jsonEncode(data),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      responseJson = returnResponse(response: response);
    } on SocketException {
      throw InternetException("");
    } on RequestTimeOut {
      throw RequestTimeOut("");
    }

    return responseJson;
  }

  ///for catch http response
  dynamic returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException;
      default:
        throw FetchedDataException(" ${response.statusCode}");
    }
  }
}
