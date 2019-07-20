import 'package:flutter/material.dart';
import 'package:paperless_app/constants.dart';
class IconUtils{

  static Widget getIconImage({num fileType}){
    Widget _avatarIcon;
    switch(fileType){
      case 0:{
        _avatarIcon=Image.asset('assets/images/directory.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
        break;
      }
      case 1: //jpg
        {
          _avatarIcon=Image.asset('assets/images/jpg.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      case 2: //
        {
          _avatarIcon=Image.asset('assets/images/png.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      case 12: //
        {
          _avatarIcon=Image.asset('assets/images/doc.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      case 15: //
        {
          _avatarIcon=Image.asset('assets/images/pdf.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      case 16: //
        {
          _avatarIcon=Image.asset('assets/images/docx.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      case 17: //
        {
          _avatarIcon=Image.asset('assets/images/zip.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      case 28: //
        {
          _avatarIcon=Image.asset('assets/images/txt.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
          break;
        }
      default:
        {
          _avatarIcon=Image.asset('assets/images/file.png',width: Constants.ContactAvatarSize,height: Constants.ContactAvatarSize,);
        }
    }
    return _avatarIcon;
  }
}