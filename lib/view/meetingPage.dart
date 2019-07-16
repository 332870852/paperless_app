import 'package:flutter/material.dart';
import '../constants.dart' show Constants, AppColors;
import '../fragment/filePage/popup_window.dart';

class MeetingPage extends StatefulWidget {
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[Text('test')],
        ),
        leading: PopupWindowButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '分类',
                style: TextStyle(color: Colors.black87),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black87,
              ),
            ],
          ),
          offset: Offset(0, 200),
          window: Container(
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
//      body: StreamBuilder(
////        builder: (BuildContext context, AsyncSnapshot snapshot) {
////          return Column(
////            children: <Widget>[
////              Text('${snapshot.data}'),
////            ],
////          );
////        },
////        initialData: 0,
////        stream: _bloc.counter,
////      ),

    );
  }
}
