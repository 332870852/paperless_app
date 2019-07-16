import 'package:json_annotation/json_annotation.dart';
part 'FileInfo.g.dart';
@JsonSerializable()
class FileInfo extends Object {//with $FileInfoSerializerMixin
  int fileId;

  /*文件id*/
  String fileName;

  /*文件名*/
  num fileType;

  /*文件类型*/
  num fsize;

  /*文件大小*/

  String filePath;

  /*文件路径*/

  DateTime createTime;

  /*文件创建时间*/
  String FileOwnerId;

  /*房间拥有者ID*/
  num treenodeId;

  /*文件夹id*/

  FileInfo(
      {this.fileId,
      this.fileName,
      this.fileType,
      this.fsize,
      this.filePath,
      this.createTime,
      this.FileOwnerId,
      this.treenodeId});

  @override
  String toString() {
    return 'FileInfo{fileId: $fileId, fileName: $fileName, fileType: $fileType, fsize: $fsize, filePath: $filePath, createTime: $createTime, FileOwnerId: $FileOwnerId, treenodeId: $treenodeId}';
  }


  factory FileInfo.fromJson(Map<String, dynamic> json) =>
      _$FileInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
}


///测试数据
class testFileData {
    List<FileInfo> fileDatas = [
    FileInfo(
        fileId: 1,
        fileName: '文件1.pdf',
        filePath: '/a/b',
        fileType: 15,
        fsize: 1024,
        treenodeId: 12,
        FileOwnerId: '123',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 2,
        fileName: 'tat.pdf',
        filePath: '/sadcb',
        fileType: 15,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 3,
        fileName: '新建文件夹',
        filePath: '/sadcb',
        fileType: 0,
        fsize: null,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 1,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的小姐姐',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 1,
        FileOwnerId: '13',
        createTime: DateTime.now()),
    FileInfo(
        fileId: 4,
        fileName: '你的',
        filePath: '/sadcb',
        fileType: 2,
        fsize: 1025254,
        treenodeId: 28,
        FileOwnerId: '13',
        createTime: DateTime.now()),
  ];

    List<FileInfo> sencodDatas = [
      FileInfo(
          fileId: 1,
          fileName: '文件1.pdf',
          filePath: '/a/b',
          fileType: 15,
          fsize: 1024,
          treenodeId: 12,
          FileOwnerId: '123',
          createTime: DateTime.now()),
      FileInfo(
          fileId: 2,
          fileName: 'tat.pdf',
          filePath: '/sadcb',
          fileType: 15,
          fsize: 1025254,
          treenodeId: 1,
          FileOwnerId: '13',
          createTime: DateTime.now()),
      FileInfo(
          fileId: 3,
          fileName: '新建文件夹',
          filePath: '/sadcb',
          fileType: 0,
          fsize: null,
          treenodeId: 1,
          FileOwnerId: '13',
          createTime: DateTime.now()),

      FileInfo(
          fileId: 4,
          fileName: '你的小姐姐',
          filePath: '/sadcb',
          fileType: 2,
          fsize: 1025254,
          treenodeId: 1,
          FileOwnerId: '13',
          createTime: DateTime.now()),
      FileInfo(
          fileId: 4,
          fileName: '你的小姐姐',
          filePath: '/sadcb',
          fileType: 2,
          fsize: 1025254,
          treenodeId: 1,
          FileOwnerId: '13',
          createTime: DateTime.now()),
      FileInfo(
          fileId: 4,
          fileName: '你的',
          filePath: '/sadcb',
          fileType: 2,
          fsize: 1025254,
          treenodeId: 28,
          FileOwnerId: '13',
          createTime: DateTime.now()),

    ];
  static testFileData mock() {
    return testFileData();
  }

}
