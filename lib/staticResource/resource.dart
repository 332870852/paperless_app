import 'package:flutter/material.dart';
import 'package:paperless_app/bloc/BottomBloc.dart';
import 'package:paperless_app/bloc/CounterBloc.dart';
import 'package:paperless_app/bloc/FileItemBloc.dart';
import 'package:paperless_app/domain/FileInfo.dart';
import 'package:paperless_app/service/FileService.dart';

final BottomBloc bloc=BottomBloc(); ///
//final FileItemBloc fileItemBloc=FileItemBloc();///
final FileItemBloc fileItemBloc= FileItemBloc();
final CounterBloc counterBloc=CounterBloc();///文件页计数

///初始文件列表
List<FileInfo> srcData = [];
///选择的文件数
List<FileInfo> fileList = [];
///初始文件夹id
var refreshId = 0;