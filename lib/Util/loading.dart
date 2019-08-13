import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:ui';
Widget fuToast(msg, defMsg, s, context) =>
    Flushbar(
      messageText: Text(
        msg != null ? s ? msg : msg + "啦 Ծ‸ Ծ" : defMsg,
        style: TextStyle(
            fontSize: 14.0, color: Colors.white, fontFamily: 'SF-UI-Display-Regular'),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      //显示位置
      icon: Icon(
        Icons.info_outline,
        size: 30.0,
        color: Colors.white,
      ),
      aroundPadding: EdgeInsets.all(8),
      borderRadius: 10,
      duration: Duration(seconds: 4),
      //显示时长
      leftBarIndicatorColor: s ? Colors.green[400] : Colors.red[400],
      backgroundColor: s ? Colors.green[400] : Colors.red[400],
    )..show(context);