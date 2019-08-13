import 'dart:math';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paperless_app/Util/loading.dart';
import 'package:paperless_app/Widget/FormCard.dart';
import 'package:paperless_app/Widget/SocialIcons.dart';
import 'package:paperless_app/constants.dart';
import 'package:xlive_switch/xlive_switch.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FormKey = GlobalKey<FormState>();
  TextEditingController nameController;
  TextEditingController pswController;
  bool _passWordVisible = false; //密码是否可见
  bool _rememberMe = false; //记住用户
  bool _autoForm = false;

  String username;

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  Widget loginForm() => Form(
        key: FormKey,
        autovalidate: _autoForm,
        child: Container(
          width: double.infinity,
          height: ScreenUtil.getInstance().setHeight(550),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 15.0),
                    blurRadius: 15.0),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, -10.0),
                    blurRadius: 10.0),
              ]),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Login",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                //账号
                Container(
                  width: 325,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil.getInstance().setSp(40),
                        fontFamily: 'SF-UI-Display-Regular'),
                    controller: nameController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(
                          left: 20.0, right: 0.0, top: 0.0, bottom: 0.0),
                      hintText: "手机号/邮箱",
                      suffix: IconButton(
                          onPressed: () =>
                              setState(() => nameController.clear()),
                          icon: Icon(Icons.highlight_off)),
                    ),
                    validator: (String value) {
                      print(value);
                      // formDE['phone'] = value;
                      return value.trim().length > 0 ? null : '请输入账号';
                    },
                  ),
                ),

                //  密码
                Container(
                  width: 325.0,
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil.getInstance().setSp(40),
                        fontFamily: 'SF-UI-Display-Regular'),
                    obscureText: !this._passWordVisible,
                    controller: pswController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: 20.0, right: 0.0, top: 10.0, bottom: 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      hintText: "密码",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            this._passWordVisible = !this._passWordVisible;
                          });
                        },
                        icon: Icon(_passWordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (String value) {
//                  formDE['password'] = value;
                      return value.trim().length > 5 ? null : '密码不能少于6位';
                    },
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(35),
                ),
                //开启记住用户
                Container(
                  width: 325.0,
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: 'SWITCH',
                        child: XlivSwitch(
                          value: _rememberMe,
                          onChanged: (e) {
                            setState(() => _rememberMe = e);
                          },
                        ),
                      ),
                      Text(
                        " 记住我?",
                        style: TextStyle(
                            color: Color.fromRGBO(24, 29, 40, 1),
                            fontSize: 16.0,
                            fontFamily: 'SF-UI-Display-Medium'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = new TextEditingController();
    pswController = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    pswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    // Widget loginForm=

    return WillPopScope(
      child: new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/brg/head.jpg"),
                ),
                Expanded(
                  child: Container(),
                ),
                // Image.asset("assets/brg/head.jpg")
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/brg/head.jpg",
                          width: ScreenUtil.getInstance().setWidth(110),
                          height: ScreenUtil.getInstance().setHeight(110),
                        ),
                        Text("LOGO",
                            style: TextStyle(
                                fontFamily: "Poppins-Bold",
                                fontSize: ScreenUtil.getInstance().setSp(46),
                                letterSpacing: .6,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(100),
                    ),
                    //FormCard(nameController: nameController,pswController: pswController,),
                    loginForm(),
                    SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                //TODO
                                print(nameController.text);
                                //print(submitLoginForm());
                               //fuToast('1111', "Ծ‸ Ծ验证码错误", false, context);
                              },
                              child: Center(
                                child: Text("登陆",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(600),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        horizontalLine(),
                        Text("其他登陆方式",
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "Poppins-Medium")),
                        horizontalLine()
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocialIcon(
                          colors: [
                            Color(0xFF102397),
                            Color(0xFF187adf),
                            Color(0xFF00eaf8),
                          ],
                          iconData: AppIcons.tencent_qq,
                          onPressed: () {},
                        ),
                        SocialIcon(
                          colors: [
                            Colors.green,
                            Colors.greenAccent,
                          ],
                          iconData: CustomIcons.weixin,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "新用户? ",
                          style: TextStyle(fontFamily: "Poppins-Medium"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("注册",
                              style: TextStyle(
                                  color: Color(0xFF5d74e3),
                                  fontFamily: "Poppins-Bold")),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onWillPop: () {
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
      },
    );
  }

  bool submitLoginForm() {
  //提交表单处理方法
    if (FormKey.currentState.validate()) {
      FormKey.currentState.save(); //保存
      debugPrint('username : ${nameController.text}');
      print("*********");
      return true;
    } else {
      //失败，开启自动验证数据
      setState(() {
        _autoForm = true;
      });
      //打开对话框
      return false;
    }
  }
}

class CustomIcons {
  static const IconData tencent_qq =
      IconData(0xe63b, fontFamily: "appIconFont");
  static const IconData weixin = IconData(0xe63c, fontFamily: "appIconFont");
}
