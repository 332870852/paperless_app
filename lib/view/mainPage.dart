import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperless_app/bloc/BottomBloc.dart';
import 'package:paperless_app/bloc/FileItem_event.dart';
import 'package:paperless_app/bloc/bottomBar_event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paperless_app/bloc/counter_event.dart';
import 'package:paperless_app/fragment/ablertDialog.dart';
import 'package:paperless_app/service/FileService.dart';
import 'filePage.dart';
import 'meetingPage.dart';
import 'mycenterPage.dart';
import 'historyPage.dart';
import '../constants.dart' show Constants, AppIcons;
import 'package:paperless_app/staticResource/resource.dart';

///主页面
class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
  final _WidgetOptions = [
    MeetingPage(),
    FilePage(),
    HistoryPage(),
    MyCenterPage(),
  ];
  ///底部页面数组
}


class _MainPageState extends State<MainPage> {
  int _currentIndex;
  ///文件页的index
  int rootIndex=0;
  ///当前所在页面索引
  @override
  void initState() {
    _currentIndex = 0;
    counterBloc.counter.listen((onData){
      rootIndex=onData;
    });
    FileService.getUserRootD().then((onValue){///加载文件页的初始数据
      srcData = onValue.fileInfoList;
    }).catchError((onError){
      srcData=[];
    });
  }

  void _onTapHandler(int index) {
    setState(//激活状态
        () {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomBar = BottomNavigationBar(
        fixedColor: Colors.green,
        //激活状态的颜色
        currentIndex: _currentIndex,
        //当前激活的按钮索引值
        type: BottomNavigationBarType.fixed,
        //如果底部导航栏超过四个图标，必须添加该类型
        onTap: _onTapHandler,

        ///回调
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.indexIcon,
            title: Text('首页'),
            activeIcon: AppIcons.indexIcon_selected,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.directoryIcon,
            title: Text('文件'),
            activeIcon: AppIcons.directoryIcon_selected,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.historyMeetingIcon,
            title: Text('历史'),
            activeIcon: AppIcons.historyMeetingIcon_selected,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.MyIcon,
            title: Text('我的'),
            activeIcon: AppIcons.MyIcon_selected,
          ),
        ]);

    ///文件底部导航栏
    var fileBottomBar = Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.blue),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () async {
                //TODO 下载
                /* await showDialog(
                    context: context,
                    builder: (context) => AlberInfoDialog(
                          msg: fileList[0].fileName,
                        ),
                    barrierDismissible: false);
                print(fileList);*/
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppIcons.downloadIcon,
                  Text(
                    '下载',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: FlatButton(
            onPressed: () {
              //TODO 分享
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 25.0,
                ),
                Text(
                  '分享',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )),
          Expanded(
            child: FlatButton(
              onPressed: () async {
                //TODO 删除
                if (fileList.length > 0) {
                  var flag = await showDialog(
                      context: context,
                      builder: (context) => AlberInfoDialog(
                            title: '删除文件',
                            content: Text(
                                fileList[0].fileName,
                              style: TextStyle(color: Colors.grey, fontSize: 15.0),
                            ),
                            okbtn: '确认删除',
                          ),
                      barrierDismissible: false);
                  if (flag) {
                    //TODO 删除
                    await setState(() {
                      fileItemBloc.counterEventSink
                          .add(FileDelEvent(deldata: fileList));
                      bloc.counterEventSink.add(FalseEvent());
                    });
                    fileList.clear();
                  }
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppIcons.deleteIcon,
                  Text(
                    '删除',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: FlatButton(
            onPressed: () async{
              //TODO 重命名
              if (fileList.length > 1) {
                Fluttertoast.showToast(msg: '不能一次性重命名两个文件');
                return;
              }
              var rename=fileList[0].fileName;
               await showDialog(
                  context: context,
                  builder: (context) => AlberInfoDialog(
                    title: '重命名',
                    content: TextField(
                      textDirection: TextDirection.ltr,
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        hintStyle:
                        TextStyle(color: Colors.grey, fontSize: 18.0),
                        suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: (){
                          rename="";
                        })
                      ),
                      controller: TextEditingController.fromValue(TextEditingValue(
                        text: rename,
                        selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream,
                        offset: fileList[0].fileName.length))
                      )),
                    ),
                    okbtn: '确认修改',
                  ),
                  barrierDismissible: false);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppIcons.cmmIcon,
                Text(
                  '重命名',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          )),
          Expanded(
              child: FlatButton(
            onPressed: () {
              //TODO 更多
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppIcons.moreIcon,
                Text(
                  '更多',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )),
        ],
      ),
    );

    return WillPopScope(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Builder(
              builder: (context) =>
            IndexedStack(children: widget._WidgetOptions,
           index: _currentIndex,),
            ),

            /// 添加底部导航栏
            bottomNavigationBar: StreamBuilder<bool>(
              initialData: false,
              stream: bloc.counter,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                // print('****${snapshot.data}');
                if (snapshot.data) {
                  return fileBottomBar;
                } else {
                  return bottomBar;
                }
              },
            ),
          ),
        ),
        onWillPop: (){
         if(_currentIndex==1&&rootIndex>0){///文件页，并且不是首页
           print("***tt、、${rootIndex}");
           fileItemBloc.counterEventSink.add(FileAddEvent(data: FilePage.testoldData));
          counterBloc.counterEventSink.add(DecEvent());
         }else
          return _onwillPop(context);
        });
  }

  Future<bool> _onwillPop(context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('你确定要退出吗?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () async {
                    // Navigator.pop(context, true);
                    await SystemChannels.platform
                        .invokeMethod('SystemNavigator.pop');
                  },
                  child: Text('是'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('否'),
                ),
              ],
            ));
  }
}
