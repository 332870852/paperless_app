import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paperless_app/service/FileService.dart';
///选择上传文件夹页
class AddFilePage extends StatefulWidget {
  final int rootDIndex;///当前文件夹id
  AddFilePage({Key key, @required this.rootDIndex}):super(key:key);
  _AddFilePageState createState() => _AddFilePageState();
}

class _AddFilePageState extends State<AddFilePage> {
  File _image; ///用户选择的照片

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          child: Container(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/picture.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  '上传照片',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onTap: () async{
                            debugPrint("点击了照片");
                            print(widget.rootDIndex);
                             choosePic(imageSource: ImageSource.gallery,tid: widget.rootDIndex.toString());
                             Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/video.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    '视频',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              debugPrint("点击了视频");
                            },
                          )),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/wendang.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    '文档',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              debugPrint("点击了文档");
                            },
                          )),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/music.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    '音乐',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              debugPrint("点击了音乐");
                            },
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/application.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    '应用',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              debugPrint("点击了应用");
                            },
                          )),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/qita.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    '其他',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              debugPrint("点击了其他");
                            },
                          )),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      child: SizedBox(),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ));
  }

  void choosePic({@required ImageSource imageSource, String tid}) async {///从照相机选取图片
    var image = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      _image=image;
    });
    print(_image);
    FileService.uploadFiles(tid:tid,file: _image).then((onValue){
      Fluttertoast.showToast(msg: '上传成功');
    }).catchError((onError){
      Fluttertoast.showToast(msg: onError.toString());
    });
  }
}
