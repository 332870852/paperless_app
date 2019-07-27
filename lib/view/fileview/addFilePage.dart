import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paperless_app/service/FileService.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:paperless_app/view/fileview/listFilePage.dart';
import 'package:paperless_app/view/fileview/transferFilePage.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
// import 'package:file_picker/file_picker.dart';

///选择上传文件夹页
class AddFilePage extends StatefulWidget {
  final int rootDIndex;

  ///当前文件夹id
  AddFilePage({Key key, @required this.rootDIndex}) : super(key: key);

  _AddFilePageState createState() => _AddFilePageState();
}

class _AddFilePageState extends State<AddFilePage> {
  //File _image;
  List<File> photoList = []; //用户选择的图片


  ///用户选择的照片

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
                icon: CircleAvatar(backgroundColor: Colors.black.withOpacity(0.1),child: Icon(
          Icons.clear,
          color: Colors.white,
        ),),
                highlightColor: Colors.transparent,
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
                        child: InkWell(
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
                          onTap: () async {
                            debugPrint("点击了照片");
                            print(widget.rootDIndex);
//                              choosePic(
//                                  imageSource: ImageSource.gallery,
//                                  tid: widget.rootDIndex.toString());
                            await _pickImage(pickType: PickType.onlyImage).then((onValue) {
                              print("上传。。。。。。${onValue}");
                              if(onValue!=null&&onValue.length>0)
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>transferFilePage(initIndex:1,fileList: onValue,)));
//                              FileService.uploadFiles(
//                                      tid: widget.rootDIndex.toString(),
//                                      files: onValue)
//                                  .then((onValue) {
//                                Fluttertoast.showToast(msg: '上传成功');
//                              }).catchError((onError) {
//                                Fluttertoast.showToast(msg: onError.toString());
//                              });

                            });
                            //Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: zujian(assetImage: 'assets/images/video.png', title: '上传视频',onTap: (){
                            print('点击了上传视频');
                          })),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: zujian(assetImage: 'assets/images/wendang.png', title: '上传文档',onTap: (){
                            print('点击了上传文档');
                          })),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: zujian(assetImage: 'assets/images/music.png', title: '上传音乐',onTap: (){
                            print('点击了上传音乐');
                          })),
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
                          child: zujian(assetImage: 'assets/images/application.png', title: '上传应用',onTap: (){
                            debugPrint("点击了应用");
                          })),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: zujian(assetImage: 'assets/images/qita.png', title: '上传其他文件',onTap: (){
                            debugPrint("点击了其他文件");
                          })),
                    ),
                    Expanded(
                      child: new Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: zujian(assetImage: 'assets/images/directory.png', title: '新建文件夹',onTap: (){
                            debugPrint("点击了其他文件");
                          })),
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

//    void choosePic({@required ImageSource imageSource, String tid}) async {
//      ///从照相机选取图片
//      var image = await ImagePicker.pickImage(source: imageSource);
//      setState(() {
//        _image = image;
//      });
//      print(_image);
//      FileService.uploadFiles(tid: tid, file: _image).then((onValue) {
//        Fluttertoast.showToast(msg: '上传成功');
//      }).catchError((onError) {
//        Fluttertoast.showToast(msg: onError.toString());
//      });
//    }

  ///封装组件
  Widget zujian({@required String assetImage,@required String title,Function onTap}){
    return InkWell(
      child: Container(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              assetImage,
              width: 40,
              height: 40,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Future<List<File>> _pickImage({@required PickType pickType}) async {

    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
      context: context,
      /// The following are optional parameters.
      themeColor: Theme.of(context).primaryColor,
      // the title color and bottom color
      padding: 1.0,
      // item padding
      dividerColor: Colors.grey,
      // divider color
      disableColor: Colors.grey.shade300,
      // the check box disable color
      itemRadio: 0.88,
      // the content item radio
      maxSelected: 8,
      // max picker image count
      provider: I18nProvider.chinese,
      // i18n provider ,default is chinese. , you can custom I18nProvider or use ENProvider()
      rowCount: 4,
      // item row count
      textColor: Colors.white,
      // text color
      thumbSize: 200,
      // preview thumb size , default is 64
      sortDelegate: SortDelegate.common,
      // default is common ,or you make custom delegate to sort your gallery
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
      ),
      // default is DefaultCheckBoxBuilderDelegate ,or you make custom delegate to create checkbox
      // if you want to build custom loading widget,extends LoadingDelegate [see example/lib/main.dart]
      pickType: pickType, // all/image/video
    );
    return getPhotoFile(imgList);
  }

  Future<List<File>> getPhotoFile(List<AssetEntity> imgList) async {
    for (int i = 0; i < imgList.length; i++) {
      AssetEntity item = imgList[i];
      File tempFile = await item.file;
      photoList.add(tempFile);
    }
    return photoList;
  }
  void chooseMulti_Pic() async {
    List<File> imageList =
        await MultiImagePicker.pickImages(maxImages: 10).catchError((onError) {
      print(onError);
    });
    print(imageList);
  }

  void chooseMulti_Video()async{
    Map<String,String> filesPaths;

//    filesPaths=await FilePicker.getMultiFilePath(type: FileType.VIDEO,fileExtension: 'mp4');
//    List<String> allNames = filesPaths.keys; // List of all file names
//    List<String> allPaths = filesPaths.values; // List of all paths
//    print(allNames);
//    print(allPaths);
  }
}
