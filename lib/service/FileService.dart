import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paperless_app/bloc/FileItem_event.dart';
import 'package:paperless_app/constanApi.dart';
import 'package:paperless_app/data/HttpRequest.dart';
import 'package:paperless_app/data/ResponseModel.dart';
import 'package:paperless_app/domain/FileInfo.dart';
import 'package:paperless_app/domain/TreeNode.dart';
import 'package:paperless_app/staticResource/resource.dart';
import 'package:paperless_app/view/filePage.dart';

class FileService {
  static var method = API.FileService_method;

  ///用户查找自己根文件夹下的列表
  static Future<TreeNode> getUserRootD() async {
    Response respData = await get(method: method+'user/getUserRootD');
    ResponseModel responseModel = ResponseModel.fromJson(respData.data);
    ///请求成功
    if (responseModel.code == 1) {
      TreeNode treeNode = TreeNode.fromJson(responseModel.data);
      if (treeNode.children != null) {///文件夹
        treeNode.children.forEach((data) {
          FileInfo info = FileInfo(
              fileId: data.id,
              fileName: data.text,
              fileType: 0,
              filePath: data.path,
              treenodeId: data.parentId,
              FileOwnerId: data.uid);
          treeNode.fileInfoList.add(info);
        });
      }
      await fileItemBloc.counterEventSink
          .add(FileAddEvent(data: treeNode.fileInfoList)); //
      return treeNode;
    } else {
      ///失败原因
      throw responseModel.errors[0];
    }
  }

  ///
  static Future<TreeNode> getUserTrerNodes({@required int tid}) async{
    Map<String, String> map=new Map();
    map.putIfAbsent('tid', ()=>tid.toString());
    Response respData = await get(method: method+'user/getUserTrerNodes',requestmap: map);
    ResponseModel responseModel = ResponseModel.fromJson(respData.data);
    ///请求成功
    if (responseModel.code == 1) {
      TreeNode treeNode = TreeNode.fromJson(responseModel.data);
      if (treeNode.children != null) {///文件夹
        treeNode.children.forEach((data) {
          FileInfo info = FileInfo(
              fileId: data.id,
              fileName: data.text,
              fileType: 0,
              filePath: data.path,
              treenodeId: data.parentId,
              FileOwnerId: data.uid);
          treeNode.fileInfoList.add(info);
        });
      }
      fileItemBloc.counterEventSink
          .add(FileAddEvent(data: treeNode.fileInfoList)); //
      return treeNode;
    } else {
      ///失败原因
      throw responseModel.errors[0];
    }
  }
}
