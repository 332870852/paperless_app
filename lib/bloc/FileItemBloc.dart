import 'dart:async';

import 'package:paperless_app/bloc/FileItem_event.dart';
import 'package:paperless_app/domain/FileInfo.dart';
class FileItemBloc{
  List<FileInfo> _object;

  final _counterStateController=StreamController.broadcast();
  StreamSink<Object> get _isCounter=>_counterStateController.sink;

  Stream<Object> get counter=>_counterStateController.stream;

  final _counterEventController=StreamController<FileItemChangeEvent>.broadcast();
  Sink<FileItemChangeEvent> get counterEventSink=>_counterEventController.sink;

  FileItemBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }
  void _mapEventToState(FileItemChangeEvent event){

    if(event is FileAddEvent)
    {
      _object=event.data;
      _isCounter.add(_object);
    }else if(event is FileDelEvent){
      List<FileInfo> del=event.deldata;
      del.forEach((f){
        _object.remove(f);
      });
      _isCounter.add(_object);
    }

  }
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }

}