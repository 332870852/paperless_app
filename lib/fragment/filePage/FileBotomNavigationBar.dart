import 'package:flutter/material.dart';
import 'package:paperless_app/constants.dart';

class FileBotomNavigationBar extends StatefulWidget {
  _FileBotomNavigationBarState createState() => _FileBotomNavigationBarState();

  final BuildContext contexts;
  FileBotomNavigationBar({Key key,this.contexts}) : super(key:key);


}

class _FileBotomNavigationBarState extends State<FileBotomNavigationBar> {
  int _currentIndex;

  ///当前所在页面索引

  void _onTapHandler(int index) {
    setState(//激活状态
        () {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            title: Text('下载'),
            activeIcon: AppIcons.indexIcon_selected,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.directoryIcon,
            title: Text('分享'),
            activeIcon: AppIcons.directoryIcon_selected,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.historyMeetingIcon,
            title: Text('删除'),
            activeIcon: AppIcons.historyMeetingIcon_selected,
          ),
          BottomNavigationBarItem(
            icon: AppIcons.MyIcon,
            title: Text('重命名'),
            activeIcon: AppIcons.MyIcon_selected,
          ),
        ]);
  }
}
