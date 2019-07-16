abstract class FileItemChangeEvent{

}

class FileAddEvent extends FileItemChangeEvent{
  final Object data;
  FileAddEvent({this.data});
  Object get getdata=>this.data;
}

class FileDelEvent extends FileItemChangeEvent{
  final Object deldata;
  FileDelEvent({this.deldata});
  Object get getdeldata=>this.deldata;
}
