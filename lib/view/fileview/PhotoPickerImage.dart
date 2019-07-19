import 'package:flutter/material.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';


class PhotoPickerImage extends StatefulWidget{
  _PhotoPickerImage createState()=>_PhotoPickerImage();

}

class _PhotoPickerImage extends State<PhotoPickerImage>with LoadingDelegate{
  void _pickImage() async {
    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
      context: context,
      // BuildContext requied

      /// The following are optional parameters.
      themeColor: Colors.green,
      // the title color and bottom color
      padding: 1.0,
      // item padding
      dividerColor: Colors.grey,
      // divider color
      disableColor: Colors.grey.shade300,
      // the check box disable color
      itemRadio: 0.88,
      // the content item radio
      maxSelected: 8,
      // max picker image count
      provider: I18nProvider.chinese,
      // i18n provider ,default is chinese. , you can custom I18nProvider or use ENProvider()
      rowCount: 5,
      // item row count
      textColor: Colors.white,
      // text color
      thumbSize: 150,
      // preview thumb size , default is 64
      sortDelegate: SortDelegate.common,
      // default is common ,or you make custom delegate to sort your gallery
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
      ),
      // default is DefaultCheckBoxBuilderDelegate ,or you make custom delegate to create checkbox

      loadingDelegate: this,
      // if you want to build custom loading widget,extends LoadingDelegate [see example/lib/main.dart]

      pickType: PickType.onlyImage, // all/image/video
    );

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }

  @override
  Widget buildBigImageLoading(BuildContext context, AssetEntity entity, Color themeColor) {
    // TODO: implement buildBigImageLoading
    return null;
  }

  @override
  Widget buildPreviewLoading(BuildContext context, AssetEntity entity, Color themeColor) {
    // TODO: implement buildPreviewLoading
    return null;
  }

}