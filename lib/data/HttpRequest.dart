import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:paperless_app/constanApi.dart';


Future<Response> get({@required String method, Map requestmap}) async {
  var url = serverUrl+method;
  Map<String, String> map = new Map();
//  map.putIfAbsent('v', () => '1.1');
//  map.putIfAbsent('format', () => 'json');
//  map.putIfAbsent('method', () => method);

  print(requestmap);
  if (requestmap!=null) {
    map.addAll(requestmap);
  }

  Response response;
  Dio dio = new Dio();
  try {
    dio.options.headers.putIfAbsent("token", ()=>"2aad7378-d68c-454c-b045-862433c9cb35");
    response =  await dio.get(url, data: map);
    if (response.statusCode == 200) {
      //print(response);
      return response;
    } else {
      print('code: ${response.statusCode},data:${response.data}');
    }
  } catch (e) {
    print("get *********$e");
    throw e;
  }
  return null;
}