import 'dart:io';

import 'package:flutter/material.dart';
import 'package:paperless_app/constants.dart';
import 'package:paperless_app/view/fileview/listFilePage.dart';

class transferFilePage extends StatefulWidget {
  final List<File> fileList;
  final int initIndex;

  transferFilePage({Key key, @required this.fileList, this.initIndex})
      : super(key: key);

  _transferFilePageState createState() => _transferFilePageState();
}

class _transferFilePageState extends State<transferFilePage>
    with SingleTickerProviderStateMixin{
  List<Widget> tabs = [
    Tab(
      text: '下载列表',
    ),
    Tab(
      text: '上传列表',
    ),
  ];

  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _currentIndex = widget.initIndex;
    super.initState();
    _tabController =
        new TabController(initialIndex: _currentIndex, length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.8,
              leading: IconButton(
                  icon: AppIcons.backIcon,
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  }),
              title: Text(
                '传输列表',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    icon: AppIcons.selectFileIcon,
                    onPressed: () {
                      print('选择文件按钮');
                    }),
              ],
              bottom: TabBar(
                tabs: tabs,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                indicatorWeight: 4.0,
                controller: _tabController,
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                DownFileListPage(
                  fList: null,
                ),
                UpFileListPage(
                  fList: widget.fileList,
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        });
  }


}
