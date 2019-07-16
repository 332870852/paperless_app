import 'package:flutter/material.dart';

class AlberInfoDialog extends StatelessWidget {
  final Widget content;
  final String title;
  final String okbtn;
  final String cancelbtn;
  AlberInfoDialog({Key key, @required this.content,@required this.title,this.okbtn,this.cancelbtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      content: content,
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(child: FlatButton(
              //color: Colors.blue,
              child: Text(
                okbtn!=null&&okbtn.isNotEmpty?okbtn:'确认',
                style: TextStyle(color: Colors.blue,fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context,true);
              },
            ),padding: EdgeInsets.only(left: 30,right: 70),),
            //SizedBox(width: 70,),
            Padding(child:FlatButton(
              // color: Colors.blue,
              child: Text(
                cancelbtn!=null&&cancelbtn.isNotEmpty?cancelbtn:'取消',
                style: TextStyle(color: Colors.grey,fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context,false);
              },
            ),padding: EdgeInsets.only(right: 20),),

          ],
        )
      ],
    );
  }
}
