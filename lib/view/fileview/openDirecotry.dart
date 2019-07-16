import 'package:flutter/material.dart';
import 'package:paperless_app/bloc/FileItemBloc.dart';
import 'package:paperless_app/bloc/FileItem_event.dart';
import 'package:paperless_app/bloc/bottomBar_event.dart';
import 'package:paperless_app/fragment/filePage/FileBotomNavigationBar.dart';
import 'package:paperless_app/fragment/filePage/FileItemView.dart';
import 'package:paperless_app/constants.dart' show Constants, AppColors;
import 'package:paperless_app/domain/FileInfo.dart';
import 'package:paperless_app/staticResource/resource.dart';

///文件
class DirecotryPage extends StatefulWidget {
  final List<FileInfo> fileData;
  DirecotryPage({Key key,@required this.fileData}):super(key:key);
  _DirecotryPageState createState() => _DirecotryPageState();
}

class _DirecotryPageState extends State<DirecotryPage> {
  bool isselected;

  ///分类
  bool flag;
  List<bool> popupMenu;
  ///是否弹出下拉分类
  bool fileselected = false;

  ///选择的文件
  List<bool> _cflags = [];

  //TODO 测试数据
  var testdata;

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
    for (int i = 0; i < widget.fileData.length; i++) {
      _cflags.add(false);
    }
  }

  @override
  void initState() {
    testdata=widget.fileData;
    bloc.counter.listen((onData) {
      // setState(() {
      if (!mounted) return;
      issrc_appbar = !onData;
      if (issrc_appbar)
        setState(() {
          initflag();
        });
      // });
    });
    fileItemBloc.counterEventSink.add(FileAddEvent(data:testdata));
    fileItemBloc.counter.listen((onData) {
      // setState(() {
      testdata = onData;
      //});
    });
    isselected = false;
    popupMenu = [true, false, false];
    flag = true;
    initflag();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget srcAppbar = AppBar(
      leading: Row(children: <Widget>[
        Icon(Icons.arrow_back_ios,color: Colors.black,),
        Text('test'),
      ],),
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
              fileList.addAll(testdata.fileDatas);

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
              initialData: testdata,
              stream: fileItemBloc.counter,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<FileInfo> mockFileData = snapshot.data;
                if (mockFileData.length == 0) {
                  // return Center(child: Text('无文件'),);
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
                    return GestureDetector(
                      child: Container(
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
                          )),
                      onTap: () {
                        //TODO 单击文件
                        debugPrint("单击文件");
                        if (issrc_appbar == true) {
                          ///没有多选的情况
                          if (mockFileData[index - 1].fileType != 0) {
                            ///不是文件夹，直接打开

                          } else {
                            ///文件夹，请求打开文件夹

                          }
                        }
                      },
                      onLongPress: () {
                        //TODO  长按文件
                        //   print("dfcjk ${fileList.length}");
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
                  itemCount: snapshot.data.length,
                );
              }),
          onRefresh: () {
            debugPrint("上拉刷新");
          }),
    );
  }
}
