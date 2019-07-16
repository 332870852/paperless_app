import 'package:flutter/material.dart';
import 'package:paperless_app/constants.dart' show Constants, AppIcons;
///文件页的下拉控件
class DropPanelMenue extends StatelessWidget {
  DropPanelMenue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(child: Container(
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
                          '照片',
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    debugPrint("点击了照片");
                  },),
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
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      debugPrint("点击了视频");
                    },
                  )
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
                            'assets/images/wendang.png',
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            '文档',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      debugPrint("点击了文档");
                    },
                  )
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
                            'assets/images/music.png',
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            '音乐',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      debugPrint("点击了音乐");
                    },
                  )
                ),
              ),
            ],
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
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      debugPrint("点击了应用");
                    },
                  )
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
                            'assets/images/qita.png',
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            '其他',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      debugPrint("点击了其他");
                    },
                  )
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: SizedBox(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
