import 'package:flutter/material.dart';

class Constants {
  static const IconFontFamily = "appIconFont";

  ///调用自定义图标
  static final ThemeData themeData = ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Colors.deepPurple,
      accentColor: Colors.blue,
      primaryTextTheme: TextTheme(
          display1: TextStyle(color: Colors.deepPurple, fontSize: 18),
          display2: TextStyle(color: Colors.blue, fontSize: 18),
          display3: TextStyle(color: Colors.white, fontSize: 18)));

  ///全局主题
  static const DividerWith = 1.0;
  static const ContactAvatarSize = 30.0;
}

class AppIcons {
  static const indexIcon = Icon(
    IconData(0xe622, fontFamily: Constants.IconFontFamily),
    size: 25.0,
  );

  ///首页
  static const indexIcon_selected = Icon(
    IconData(0xe622, fontFamily: Constants.IconFontFamily),
    color: Colors.deepPurple,
    size: 25.0,
  );
  static const directoryIcon =
      Icon(IconData(0xe674, fontFamily: Constants.IconFontFamily), size: 25.0);

  ///文件夹
  static const directoryIcon_selected = Icon(
      IconData(0xe674, fontFamily: Constants.IconFontFamily),
      color: Colors.deepPurple,
      size: 25.0);
  static const historyMeetingIcon =
      Icon(IconData(0xe604, fontFamily: Constants.IconFontFamily), size: 25.0);

  ///历史会议
  static const historyMeetingIcon_selected = Icon(
      IconData(0xe604, fontFamily: Constants.IconFontFamily),
      color: Colors.deepPurple,
      size: 25.0);
  static const MyIcon =
      Icon(IconData(0xe62c, fontFamily: Constants.IconFontFamily), size: 25.0);

  ///个人中心
  static const MyIcon_selected = Icon(
      IconData(0xe62c, fontFamily: Constants.IconFontFamily),
      color: Colors.deepPurple,
      size: 25.0);

  static const pictureIcon = Icon(
    IconData(0xe60f,
        fontFamily: Constants.IconFontFamily, matchTextDirection: true),
    size: 30.0,
  );

  ///照片
  ///未选中
  static const no_selectIcon = Icon(
    IconData(0xe635, fontFamily: Constants.IconFontFamily),
    size: 25.0,
  );

  ///选中
  static const selectIcon = Icon(
    IconData(0xe634, fontFamily: Constants.IconFontFamily),
    size: 25.0,
    color: Colors.white,
  );

  ///下载
  static const downloadIcon = Icon(
    IconData(0xe67f, fontFamily: Constants.IconFontFamily),
    size: 25.0,
    color: Colors.white,
  );

  ///删除
  static const deleteIcon = Icon(
    IconData(0xe61d, fontFamily: Constants.IconFontFamily),
    size: 25.0,
    color: Colors.white,
  );

  ///更多
  static const moreIcon = Icon(
    IconData(0xe737, fontFamily: Constants.IconFontFamily),
    size: 25.0,
    color: Colors.white,
  );

  ///重命名
  static const cmmIcon = Icon(
    IconData(0xe63e, fontFamily: Constants.IconFontFamily),
    size: 25.0,
    color: Colors.white,
  );

  ///返回按钮
  static const backIcon = Icon(
    Icons.arrow_back_ios,
    color: Colors.white,
  );

  ///选择文件
  static const selectFileIcon = Icon(
    IconData(0xe637, fontFamily: Constants.IconFontFamily),
    size: 25.0,
    color: Colors.white,
  );
}

class AppColors {
  static const AppBarPopupMenuColor = 0xffffffff;
  static const DividerWith = 1.0;
  static const DividerColor = 0xffd9d9d9;
  static const TitleTextColor = 0xff353535;
  static const TimeTextColor = 0xff9e9e9e;
  static const splashbkColor = 0xFF000000;
}

class AppStyle {
  static const TitleStyle = TextStyle(
    fontSize: 16.0,
    color: Color(AppColors.TitleTextColor),
  );

  static const TimeStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.TimeTextColor),
  );
}
