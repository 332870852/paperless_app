// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FileInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) {
  return FileInfo(
      fileId: json['fileId'] as int,
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as num,
      fsize: json['fsize'] as num,
      filePath: json['filePath'] as String,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      FileOwnerId: json['FileOwnerId'] as String,
      treenodeId: json['treenodeId'] as num);
}

Map<String, dynamic> _$FileInfoToJson(FileInfo instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'fsize': instance.fsize,
      'filePath': instance.filePath,
      'createTime': instance.createTime?.toIso8601String(),
      'FileOwnerId': instance.FileOwnerId,
      'treenodeId': instance.treenodeId
    };
