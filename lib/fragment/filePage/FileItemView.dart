import 'package:flutter/material.dart';
import 'package:paperless_app/bloc/FileItemBloc.dart';
import 'package:paperless_app/constants.dart'
    show Constants, AppColors, AppStyle, AppIcons;
import 'package:paperless_app/Util/IconUtil.dart';
import 'package:paperless_app/domain/FileInfo.dart';
import 'package:paperless_app/Util/date_format_base.dart';

import 'package:paperless_app/staticResource/resource.dart';

class FileItemView extends StatefulWidget {
  FileItemView({@required this.fileInfo});

  final FileInfo fileInfo;

  _FileItemViewState createState() => _FileItemViewState();
}

class _FileItemViewState extends State<FileItemView> {
  @override
  Widget build(BuildContext context) {
    FileInfo fileInfo = widget.fileInfo;
    ///
    //左边的标签
    Widget avatar;
    avatar = IconUtils.getIconImage(fileType: fileInfo.fileType);

    Widget avatarContainer = avatar;
    //列表项主体部分

    num size = 0;
    if (fileInfo.fsize != null) {
      size = fileInfo.fsize / (1024 * 1024);
    }

    print("${size.toStringAsPrecision(4)}");
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 15.0, bottom: 10.0, top: 8.0),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
            color: Color(AppColors.DividerColor), width: Constants.DividerWith),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          avatarContainer,
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  fileInfo.fileName,
                  style: AppStyle.TitleStyle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      formatDate(fileInfo.createTime!=null?fileInfo.createTime:DateTime.now(), [
                        yyyy,
                        '-',
                        mm,
                        '-',
                        dd,
                        ' ',
                        HH,
                        ':',
                        nn,
                        ':',
                        ss,
                        ' '
                      ]),
                      style: AppStyle.TimeStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${size != 0 ? size.toStringAsPrecision(4) + 'Mb' : ''}',
                      style: AppStyle.TimeStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
//          StreamBuilder<bool>(
//            initialData: false,
//            stream: widget.bloc.counter,
//            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//              print('file ${snapshot.data}');
//              if (snapshot.data) {
//                return AppIcons.selectIcon;
//              } else {
//                return AppIcons.no_selectIcon;
//              }
//            },
//          ),
        ],
      ),
    );
  }
}
