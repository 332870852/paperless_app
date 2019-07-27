import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paperless_app/Util/FileType.dart';
import 'package:paperless_app/constants.dart';
import 'package:paperless_app/domain/FileInfo.dart';
import 'package:paperless_app/fragment/filePage/FileItemView.dart';

class UpFileListPage extends StatefulWidget {
  final List<File> fList;

  UpFileListPage({Key key, @required this.fList}) : super(key: key);

  _UpFileListPageState createState() => _UpFileListPageState();
}



Future<dynamic> addFile(List<File> fList) async {
  List<FileInfo> data=[];
  for(File f in fList){
    var filename=f.path.substring(f.path.lastIndexOf('/')+1);
   var fileType=FileType().mFileTypes[filename.substring(filename.lastIndexOf('.')+1)];
   FileInfo fileInfo=new FileInfo();
   fileInfo.fileName=filename;
   fileInfo.fileType=fileType;
   fileInfo.fsize=f.lengthSync();
    data.add(fileInfo);
  }
  return data;
}

class _UpFileListPageState extends State<UpFileListPage>{
  String tag = "全部暂停";
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: addFile(widget.fList),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Icon(Icons.warning,color: Colors.yellow, size: 50.0,),
                  Image.asset(
                    "assets/images/upload.png",
                    scale: 2.0,
                  ),
                  Text(
                    '暂无上传记录',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: Constants.DividerWith,
                              color: Color(AppColors.DividerColor))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            '正在上传(${snapshot.data.length})',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ChoiceChip(
                            label: Text(
                              tag,
                            ),
                            selected: selected,
                            onSelected: (value) {
                              print(value);
                              selected = !selected;
                              if(selected)
                                tag = "全部开始";
                              else
                                tag = "全部暂停";
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return FileItemView(fileInfo: snapshot.data[index-1],);
              });
        });
  }

}

class DownFileListPage extends StatefulWidget {
  final List<File> fList;

  DownFileListPage({Key key, @required this.fList}) : super(key: key);

  _DownFileListPageState createState() => _DownFileListPageState();
}

class _DownFileListPageState extends State<DownFileListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: addFile(widget.fList),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            );
          }

          if (snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Icon(Icons.warning,color: Colors.yellow, size: 50.0,),
                  Image.asset(
                    "assets/images/download.png",
                    scale: 2.0,
                  ),
                  Text(
                    '暂无上传记录',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: <Widget>[
                      Text('正在上传(${snapshot.data.length})'),
                      Chip(label: Text('全部暂停'))
                    ],
                  );
                }
              });
        });
  }
}
