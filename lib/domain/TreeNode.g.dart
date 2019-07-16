// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TreeNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) {
  return TreeNode(
      json['id'] as int,
      json['text'] as String,
      (json['children'] as List)
          ?.map((e) =>
              e == null ? null : TreeNode.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['parentId'] as num,
      json['path'] as String,
      json['uid'] as String,
      json['roomid'] as String,
      (json['fileInfoList'] as List)
          ?.map((e) =>
              e == null ? null : FileInfo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TreeNodeToJson(TreeNode instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'children': instance.children,
      'parentId': instance.parentId,
      'path': instance.path,
      'uid': instance.uid,
      'roomid': instance.roomid,
      'fileInfoList': instance.fileInfoList
    };
