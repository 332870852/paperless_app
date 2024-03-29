import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:paperless_app/constanApi.dart';
import 'package:paperless_app/data/ResponseModel.dart';


Future<Response> get({@required String method, Map requestmap}) async {
  var url = serverUrl+method;
  Map<String, dynamic> map = new Map();
//  map.putIfAbsent('v', () => '1.1');
//  map.putIfAbsent('format', () => 'json');
//  map.putIfAbsent('method', () => method);
  print(requestmap);
  if (requestmap!=null) {
    map.addAll(requestmap);
  }

  Response response;
  Dio dio = new Dio();
  try {//b9995e80-314a-4d5f-896c-1999ffa19639
    dio.options.headers.putIfAbsent("token", ()=>"857b8e2a-91ad-4fb1-b382-8067c2720e34");//
    response =  await dio.get(url, data: map);
    if (response.statusCode == 200) {
      //print(response);
      return response;
    } else {
      print('code: ${response.statusCode},data:${response.data}');
    }
  } on DioError catch(e){
    if(e.response.data!=null){
      ResponseModel responseModel=ResponseModel.fromJson(e.response.data);
     throw responseModel.errors[0];
    }else{
      rethrow ;
    }

  }catch (e) {
    print("get *********$e}");
    throw e;
  }
  return null;
}


Future<Response> post({@required String method, Map requestmap}) async {
  var url = serverUrl+method;
  //Map<String, dynamic> map = new Map();
  FormData formData=FormData();
  formData.addAll(requestmap);
  print(formData);
//  if (requestmap!=null) {
//    map.addAll(requestmap);
//  }
  Response response;
  Dio dio = new Dio();
  try {//b9995e80-314a-4d5f-896c-1999ffa19639
    dio.options.headers.putIfAbsent("token", ()=>"857b8e2a-91ad-4fb1-b382-8067c2720e34");//
    response =  await dio.post(url, data: formData,onUploadProgress: (send,total){

      print("send: $send, total: $total");
    });
    if (response.statusCode == 200) {
      print(response);
      return response;
    } else {
      print('code: ${response.statusCode},data:${response.data}');
    }
  } on DioError catch(e){
    if(e.response.data!=null){
      ResponseModel responseModel=ResponseModel.fromJson(e.response.data);
      throw responseModel.errors[0];
    }else{
      rethrow ;
    }

  }catch (e) {
    print("get *********$e}");
    throw e;
  }
  return null;
}