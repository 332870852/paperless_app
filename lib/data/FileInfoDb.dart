import 'package:paperless_app/domain/FileInfo.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String DbName = "FileInfo.db";
final String columnId = "_id";
//final String ColumnUsername = "username";

class FileInfoProvider {
  final String tableName = "FileInfo"; //表名
  Database db;

  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DbName);
    return path;
  }

  /////////////////////业务
  ///是否已经存在数据 插入
  Future<List<int>> insertAll(List<FileInfo> infoList) async {
    db = await open();
    List<int> list = [];
    for (int i = 0; i < infoList.length; i++) {
      var f = await getFileInfoById(infoList[i].fileId, infoList[i].fileType);
      //print("insertAll :${f}");
      if (f == null) {
        var fid = await db.insert(tableName, infoList[i].toJson());
        list.add(fid);
      }
    }
    return list;
  }

  ///查文件夹下列表 ,如果是根文件夹则两次查询
  Future<List<FileInfo>> getRootAll(String treenodeId) async {
    assert(treenodeId != null);

    db = await open();
    if (treenodeId == 'null') {
      ///
      List<Map> list = await db.rawQuery(
          'select fileId,fileName,fileType,fsize,'
          'filePath,createTime,FileOwnerId,treenodeId from $tableName where treenodeId is null');
      List<FileInfo> fileinfo =
          list.map((item) => FileInfo.fromJson(item)).toList();
      treenodeId = fileinfo[0].fileId.toString();
    }
    List<Map> maps = await db.query(
      tableName,
      columns: [
        "fileId",
        "fileName",
        "fileType",
        "fsize",
        "filePath",
        "createTime",
        "FileOwnerId",
        "treenodeId"
      ],
      where: 'treenodeId is $treenodeId',
    );

    if (maps.length > 0) {
      List<FileInfo> lists =
          maps.map((item) => FileInfo.fromJson(item)).toList();
      return lists;
    }
    return null;
  }

  ///批量删除
  Future<int> deleteAll(List<FileInfo> finfo) async {
    db = await open();
    int reslut;
    for (int i = 0; i < finfo.length; i++) {
      var f = await getFileInfoById(finfo[i].fileId, finfo[i].fileType);
      //print("insertAll :${f}");
      if (f != null) {
         reslut = await db.delete(tableName, where: "$columnId = ?", whereArgs: [f.fileId]);
      }
    }
    close();
    return reslut;
  }
  /////////////////////

  /*文件夹id*/ //
  Future<Database> open() async {
    final path = await _dbPath;
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'create table $tableName (_id INTEGER PRIMARY KEY autoincrement,'
          'fileId integer not null,'
          'fileName text not null,'
          'fileType num not null,'
          'fsize num ,'
          'filePath text,'
          'createTime text,'
          'FileOwnerId text,'
          'treenodeId num)');
    }, onUpgrade: (Database db, int oldversion, int newversion) {
      print("newdb ${newversion}");
    });
    return db;
  }

  //插入
  Future<FileInfo> insert(FileInfo fileinfo) async {
    db = await open();
    var f = await getFileInfoById(fileinfo.fileId, fileinfo.fileType);
    if(f==null)
    fileinfo.fileId = await db.insert(tableName, fileinfo.toJson());
    return fileinfo;
  }

  //id查一条数据 fileType
  Future<FileInfo> getFileInfoById(int fileId, int fileType) async {
    db = await open();
    List<Map> maps = await db.query(tableName,
        columns: [
          'fileId',
          "fileName",
          "fileType",
          "fsize",
          "filePath",
          "createTime",
          "FileOwnerId",
          "treenodeId"
        ],
        where: "fileId = ? and fileType != ?",
        whereArgs: [fileId, fileType]);
    if (maps.length > 0) {
      return FileInfo.fromJson(maps.first);
    }
    return null;
  }

  //删除
  Future<int> delete(int id) async {
    db = await open();
    int reslut =
        await db.delete(tableName, where: "$columnId = ?", whereArgs: [id]);
    close();
    return reslut;
  }

  //更新
  Future<int> update(FileInfo fileinfo) async {
    db = await open();
    var result = await db.update(tableName, fileinfo.toJson(),
        where: "fileId = ? and fileType=?",
        whereArgs: [fileinfo.fileId, fileinfo.fileType]);
    close();
    return result;
  }

  /**
   * 模糊查询
   */

  ///
  Future<List<FileInfo>> getLike(String like) async {
    db = await open();
    List<Map> list = await db
        .rawQuery('SELECT * FROM $tableName WHERE fileName like "%$like%"');
    //print(list.toString());
    List<FileInfo> persons =
        list.map((item) => FileInfo.fromJson(item)).toList();
    return persons;
  }

  ///所有
  Future<List<FileInfo>> getAll() async {
    db = await open();
    List<Map> maps = await db.query(
      tableName,
      columns: [
        "fileId",
        "fileName",
        "fileType",
        "fsize",
        "filePath",
        "createTime",
        "FileOwnerId",
        "treenodeId"
      ],
    );
    if (maps.length > 0) {
      List<FileInfo> lists =
          maps.map((item) => FileInfo.fromJson(item)).toList();
      return lists;
    }
    return null;
  }

  Future close() async => db.close();
}
