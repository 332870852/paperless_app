import 'dart:async';
import 'bottomBar_event.dart';
class BottomBloc{

  bool flag=false;
 final _counterStateController=StreamController<bool>.broadcast();
  StreamSink<bool> get _isCounter=>_counterStateController.sink;

  Stream<bool> get counter=>_counterStateController.stream;

  final _counterEventController=StreamController<ChangeEvent>.broadcast();
  Sink<ChangeEvent> get counterEventSink=>_counterEventController.sink;

  BottomBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ChangeEvent event){
      if(event is TureEvent)
        flag=true;
      else
        flag=false;
      _isCounter.add(flag);
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();

  }



}