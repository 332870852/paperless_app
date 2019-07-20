import 'package:flutter/material.dart';
import 'package:paperless_app/domain/FileInfo.dart';

class UpFileListPage extends StatefulWidget {
  final List<FileInfo> fList;

  UpFileListPage({Key key,@required this.fList}) : super(key: key);

  _UpFileListPageState createState() => _UpFileListPageState();
}

class _UpFileListPageState extends State<UpFileListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            );
          }
          if (snapshot.data == null) {
            return  Center(
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



        });
  }
}


class DownFileListPage extends StatefulWidget {
  final List<FileInfo> fList;

  DownFileListPage({Key key,@required this.fList}) : super(key: key);

  _DownFileListPageState createState() => _DownFileListPageState();
}

class _DownFileListPageState extends State<DownFileListPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            );
          }

          if (snapshot.data == null) {
            return  Center(
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

        });
  }
}
