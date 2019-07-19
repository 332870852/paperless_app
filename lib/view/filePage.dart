import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:paperless_app/bloc/FileItem_event.dart';
import 'package:paperless_app/bloc/bottomBar_event.dart';
import 'package:paperless_app/bloc/counter_event.dart';
import 'package:paperless_app/data/FileInfoDb.dart';
import 'package:paperless_app/data/HttpRequest.dart';
import 'package:paperless_app/data/ResponseModel.dart';
import 'package:paperless_app/domain/TreeNode.dart';
import 'package:paperless_app/service/FileService.dart';
import 'package:paperless_app/view/fileview/addFilePage.dart';
import '../constants.dart' show Constants, AppColors;
import '../fragment/filePage/DropPanelMenu.dart';
import '../fragment/filePage/popup_window.dart';
import '../fragment/filePage/FileItemView.dart';
import 'package:paperless_app/domain/FileInfo.dart';
import 'package:paperless_app/staticResource/resource.dart';
import 'package:fluttertoast/fluttertoast.dart';

///文件页
class FilePage extends StatefulWidget {
  static List<FileInfo> testoldData;

  FilePage({Key key}) : super(key: key);

  _FilePageState createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> with AutomaticKeepAliveClientMixin {
  bool isselected;
  FileInfoProvider _provider = new FileInfoProvider();

  ///分类按钮
  bool flag;
  List<bool> popupMenu;
  bool fileselected = false;

  ///要刷新的页面文件夹id
  //var refreshId = 0;

  ///是否弹出下拉分类
  ///选择的文件
  List<bool> _cflags = [];

  //TODO 测试数据
  //testFileData testdata = testFileData.mock();
  // List<FileInfo> srcData = [];

  ///当前文件页
  int rootIndex = 0;

  ///存放上一层数据
  // List<FileInfo> testoldData;
  String testoldTitle = "";

  ///下拉图标
  _buildPopupMenuItem({int iconName, String title, Color colors, bool index}) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              IconData(iconName, fontFamily: Constants.IconFontFamily),
              color: colors,
            ),
            Container(
              width: 12.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: index == true ? Colors.blueAccent : Colors.black87),
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }

  bool issrc_appbar = true; //是否是原Appbar

  ///初始化选择chekbox
  void initflag() {
    ///初始化checkbox
    _cflags.clear();
    for (int i = 0; i < srcData.length; i++) {
      _cflags.add(false);
    }
  }

  @override
  void initState() {
    super.initState();
    if (srcData == null) {
      FileService.getUserRootD().then((onValue) {
        //print("收到数据${onValue}");
        FileInfo info = FileInfo(
            fileId: onValue.id,
            fileName: onValue.text,
            fileType: 0,
            filePath: onValue.path,
            treenodeId: onValue.parentId,
            FileOwnerId: onValue.uid);
        refreshId=onValue.id;
        _provider.insertAll(onValue.fileInfoList);
        _provider.insert(info);
      }).catchError((onError) {
        print("http 请求失败${onError}");
        Fluttertoast.showToast(msg: '${onError.toString()}');
        ///TODO 加载本地数据库
        _provider.getRootAll('null').then((onValue) {
          fileItemBloc.counterEventSink
              .add(FileAddEvent(data: srcData = onValue));
        });
      });
    }

    bloc.counter.listen((onData) {
      if (!mounted) return;
      issrc_appbar = !onData;
      if (issrc_appbar)
        setState(() {
          initflag();
        });
    });
    fileItemBloc.counter.listen((onData) {
      srcData = onData;
      initflag();
    });
    counterBloc.counter.listen((onData) {
      rootIndex = onData;
      if (!mounted) return;
      setState(() {});
    });
    isselected = false;
    popupMenu = [true, false, false];
    flag = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  String leadingtitle = "";

  @override
  Widget build(BuildContext context) {
    super.build(context); //必须添加

    var nextleading = IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          ///TODO 返回
          if (rootIndex > 0) {
            fileItemBloc.counterEventSink
                .add(FileAddEvent(data: FilePage.testoldData));
            counterBloc.counterEventSink.add(DecEvent());
          }
          print(rootIndex);
        });
    var sortleading = PopupWindowButton(
      onTap: () {
        debugPrint("点击了分类");
        setState(() {
          isselected = !isselected; //改变
          flag = !flag;
          print(flag);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            '分类',
            style: TextStyle(color: Colors.black87),
          ),
          Icon(
            isselected == false ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: Colors.black87,
          ),
        ],
      ),
      window: DropPanelMenue(),
      offset: Offset(0, 200),
    );

    Widget srcAppbar = AppBar(
      leading: rootIndex == 0 ? sortleading : nextleading,
      title: rootIndex == 0
          ? null
          : Text(
              leadingtitle,
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black87,
            ),
            onPressed: () {
              debugPrint("点击了添加按钮");
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                return SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                  child: AddFilePage(rootDIndex: refreshId),
                );
              }));
            }),
        IconButton(
          icon: Icon(
            IconData(0xe6a9, fontFamily: Constants.IconFontFamily),
            color: Colors.black87,
          ),
          onPressed: () {
            debugPrint("点击了传输按钮");
          },
        ),
        PopupMenuButton(
          offset: Offset(0, MediaQuery.of(context).size.height + 60),
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<String>>[
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    index: popupMenu[0],
                    iconName: 0xe645,
                    title: "按名称排序",
                    colors: popupMenu[0] == true
                        ? Colors.blueAccent
                        : Colors.black87),
                value: "sort_name",
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    index: popupMenu[1],
                    iconName: 0xe653,
                    title: "按时间排序",
                    colors: popupMenu[1] == true
                        ? Colors.blueAccent
                        : Colors.black87),
                value: "sort_time",
              ),
              PopupMenuItem(
                child: _buildPopupMenuItem(
                    index: popupMenu[2],
                    iconName: 0xe720,
                    title: "选择文件",
                    colors: popupMenu[2] == true
                        ? Colors.blueAccent
                        : Colors.black87),
                value: "select_file",
              ),
            ];
          },
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          //(Icons.add),
          onSelected: (String selected) {
            print("点击的是$selected");
            switch (selected) {
              case 'sort_name':
                {
                  setState(() {
                    popupMenu[0] = true;
                    popupMenu[1] = false;
                    popupMenu[2] = false;
                  });
                  break;
                }
              case 'sort_time':
                {
                  popupMenu[0] = false;
                  popupMenu[1] = true;
                  popupMenu[2] = false;
                  break;
                }
              case 'select_file':
                {
                  popupMenu[0] = false;
                  popupMenu[1] = false;
                  popupMenu[2] = true;
                  break;
                }
            }
          },
        ),
      ],
    );

    AppBar desAppbar = AppBar(
      title: Text(
        '已选中${fileList.length}个文件',
        style: TextStyle(color: Colors.black),
      ),
      titleSpacing: 8,
      elevation: 0.5,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
          child: Text(
            '取消',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          onPressed: () {
            setState(() {
              //TODO
              ///文件数清零
              issrc_appbar = true;
              initflag();

              ///重新初始化chekbox
              ///返回原来顶部
              bloc.counterEventSink.add(FalseEvent());
              fileList.clear();

              ///取消底部导航栏
              ///变回原来的导航栏
            });
          },
          padding: EdgeInsets.all(2.0),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              //TODO 全选
              fileList.clear();

              ///清空一下
              fileList.addAll(srcData);

              ///装上所有数据
              _cflags.clear();
              for (int i = 0; i < fileList.length; i++) {
                _cflags.add(true);

                ///全选
              }
              setState(() {});
            },
            child:
                Text('全选', style: TextStyle(color: Colors.blue, fontSize: 18))),
      ],
    );
    return Scaffold(
      appBar: issrc_appbar == true ? srcAppbar : desAppbar,
      body: RefreshIndicator(
          child: StreamBuilder(
              initialData: srcData, //srcData,
              stream: fileItemBloc.counter,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //print("***${snapshot.data}");
                List<FileInfo> mockFileData = snapshot.data;
                if (mockFileData.length == 0) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Icon(Icons.warning,color: Colors.yellow, size: 50.0,),
                        Image.asset(
                          "assets/images/directory.png",
                          scale: 2.0,
                        ),
                        Text(
                          '暂无文件，快来上传吧~',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: FlatButton(
                            onPressed: () {
                              //TODO 上传文件
                              Navigator.push(context, PageRouteBuilder(pageBuilder:
                                  (BuildContext context, Animation animation,
                                  Animation secondaryAnimation) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                      begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                                      .animate(CurvedAnimation(
                                      parent: animation, curve: Curves.fastOutSlowIn)),
                                  child: AddFilePage(rootDIndex: refreshId),
                                );
                              }));

                            },
                            child: Text(
                              '上传文件',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                ///加载数据
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
                return ListView.builder(
                  //controller: _scrollController,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          //TODO 点击搜索
                          debugPrint("点击搜索");
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5.0, left: 10.0, right: 10.0),
                          alignment: Alignment(-0.9, 0),
                          width: MediaQuery.of(context).size.width - 80,
                          height: 30.0,
                          child: GestureDetector(
                            onTap: () {
                              //TODO 搜索
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  textDirection: TextDirection.ltr,
                                ),
                                Text(
                                  '搜索',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    }
                    ////////////////////
                    return InkWell(
                      child: Stack(
                        children: <Widget>[
                          FileItemView(
                            fileInfo: mockFileData[index - 1],
                          ),
                          issrc_appbar == true
                              ? SizedBox()
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Checkbox(
                                  value: _cflags[index - 1],
                                  onChanged: (value) {
                                    print(_cflags[index - 1]);
                                    setState(() {
                                      _cflags[index - 1] = value;
                                      if (value) {
                                        fileList
                                            .add(mockFileData[index - 1]);
                                        //fileItemBloc.counterEventSink.add(FileAddEvent(data: fileList));
                                        ///fileList没有数据时候，退出多选模式
                                      } else {
                                        fileList.remove(
                                            mockFileData[index - 1]);
                                        //fileItemBloc.counterEventSink.add(FileAddEvent(data: fileList));
                                      }
                                      if (fileList.length == 0) {
                                        issrc_appbar = true;

                                        ///顶部
                                        bloc.counterEventSink
                                            .add(FalseEvent());
                                      }
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                      onTap: () async {
                        //TODO 单击文件
                        debugPrint("单击文件");
                        if (issrc_appbar == true) {
                          ///没有多选的情况
                          if (mockFileData[index - 1].fileType == 0) {
                            ///是文件夹，直接打开
                            leadingtitle = mockFileData[index - 1].fileName;
                            FilePage.testoldData = mockFileData;

                            ///TODO 网络测试
                            FileService.getUserTrerNodes(
                                    tid: mockFileData[index - 1].fileId)
                                .then((onValue) {
                              if (onValue != null)
                                _provider.insertAll(onValue.fileInfoList);
                              counterBloc.counterEventSink.add(AddEvent());
                              refreshId = mockFileData[index - 1].fileId;
                            }).catchError((onError) {
                              ///查本地数据库
                              _provider
                                  .getRootAll(
                                      mockFileData[index - 1].fileId.toString())
                                  .then((onValue) {
                                if (onValue != null) {
                                  fileItemBloc.counterEventSink
                                      .add(FileAddEvent(data: onValue));
                                } else {
                                  List<FileInfo> data = [];
                                  fileItemBloc.counterEventSink
                                      .add(FileAddEvent(data: data));
                                }
                              }).whenComplete(() {
                                counterBloc.counterEventSink.add(AddEvent());
                              });

                              print("错误${onError}");
                            });
//                            if (responseModel.code == 1) {
//                              TreeNode treeNode =
//                                  TreeNode.fromJson(responseModel.data);
//                              counterBloc.counterEventSink.add(AddEvent());
//                              srcData=await treeNode.fileInfoList;
//                              print(treeNode.fileInfoList);
//                              fileItemBloc.counterEventSink.add(
//                                  FileAddEvent(data: srcData));//
//                            }

//                            fileItemBloc.counterEventSink
//                                .add(FileAddEvent(data: ));
                          } else {
                            ///文件，请求打开文件
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>DirecotryPage(fileData: mockFileData,)));

                          }
                        }
                      },
                      onLongPress: () {
                        //TODO  长按文件
                        //  print("长按文件${fileList.length}");
                        setState(() {
                          if (fileList.length == 0) {
                            ///没有数据
                            ///选择文件数///
                            fileList.add(mockFileData[index - 1]);
                            //  fileItemBloc.counterEventSink.add(FileAddEvent(data: fileList));
                            fileselected = true;

                            ///checkbox
                            _cflags[index - 1] = true;
                            issrc_appbar = false;

                            ///顶部
                            bloc.counterEventSink.add(TureEvent());
                          }
                          print("dfcjk ${fileList.length}");

                          ///弹出导航栏
                          //Itembloc.counterEventSink.add(FileTureEvent());
                        });
                      },
                    );
                  },
                  itemCount: mockFileData.length + 1,
                );
              }),
          onRefresh: _doRefresh),
    );
  }

  ///刷新操作
  Future<void> _doRefresh() async {
    debugPrint("上拉刷新");
    await Future<Null>.delayed(Duration(seconds: 1), () {
      if (rootIndex == 0) {
        FileService.getUserRootD().then((onValue) {
          fileItemBloc.counterEventSink
              .add(FileAddEvent(data: onValue.fileInfoList));
          Fluttertoast.showToast(msg: '刷新成功');
        }).catchError((onError) {
          Fluttertoast.showToast(msg: '刷新失败');
        });
      } else {
        FileService.getUserTrerNodes(tid: refreshId).then((onValue) {
          fileItemBloc.counterEventSink
              .add(FileAddEvent(data: onValue.fileInfoList));
          Fluttertoast.showToast(msg: '刷新成功');
        }).catchError((onError) {
          Fluttertoast.showToast(msg: '刷新失败');
        });
      }
      return null;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
