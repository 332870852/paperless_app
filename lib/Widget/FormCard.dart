import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xlive_switch/xlive_switch.dart';
class FormCard extends StatefulWidget   {
  _FormCardState createState()=> new _FormCardState();
}

class _FormCardState extends State<FormCard>{
  TextEditingController _nameController;
  TextEditingController _pswController;
  bool _passWordVisible = false; //密码是否可见
  bool _rememberMe = false; //记住用户
  bool _load = false; //加载状态
  bool _autoForm = false; // 自动检查表单

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController=TextEditingController();
    _pswController=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _pswController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
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
//            Text("Username",
////                style: TextStyle(
////                    fontFamily: "Poppins-Medium",
////                    fontSize: ScreenUtil.getInstance().setSp(26))),
////            TextField(
////              decoration: InputDecoration(
////                  hintText: "username",
////                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
////            ),
////            SizedBox(
////              height: ScreenUtil.getInstance().setHeight(30),
////            ),
////            Text("PassWord",
////                style: TextStyle(
////                    fontFamily: "Poppins-Medium",
////                    fontSize: ScreenUtil.getInstance().setSp(26))),
////            TextField(
////              obscureText: true,
////              decoration: InputDecoration(
////                  hintText: "Password",
////                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
////            ),
            //账号
            Container(
              width: 325,
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black87,
                    fontSize: ScreenUtil.getInstance().setSp(40),
                    fontFamily: 'SF-UI-Display-Regular'),
                controller: _nameController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.only(
                    left: 20.0,
                    right: 0.0,
                    top: 0.0,
                    bottom: 0.0),
                  hintText: "手机号/邮箱",
                  suffix: IconButton(
                      onPressed: () =>
                          setState(
                                  () =>
                                  _nameController.clear()),
                      icon: Icon(Icons.highlight_off)),
                ),
                validator: (String value) {
                  print(value);
                  return value;
//                  formDE['phone'] = value;
//                  return value
//                      .trim()
//                      .length > 0
//                      ? null
//                      : '请输入账号';
                },
              ),
            ),

            //  密码
            Container(
              width: 325.0,
              margin: EdgeInsets.only(top:20.0),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil.getInstance().setSp(40),
                    fontFamily: 'SF-UI-Display-Regular'),
                obscureText: !this._passWordVisible,
                controller: _pswController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                   filled: true,
                  contentPadding: EdgeInsets.only(
                      left: 20.0,
                      right: 0.0,
                      top: 10.0,
                      bottom: 10.0),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  hintText: "密码",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        this._passWordVisible =
                        !this._passWordVisible;
                      });
                    },
                    icon: Icon(_passWordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                validator: (String value) {
//                  formDE['password'] = value;
//                  return value
//                      .trim()
//                      .length > 5
//                      ? null
//                      : '密码不能少于6位';
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
                        color:  Color.fromRGBO(24, 29, 40, 1),
                        fontSize: 16.0,
                        fontFamily: 'SF-UI-Display-Medium'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}