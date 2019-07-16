import 'dart:async';

import 'package:paperless_app/bloc/counter_event.dart';
class CounterBloc{

  int  _rootIndex=0;

  final _counterActionController=StreamController<int>.broadcast();
  StreamSink<int> get _isCounter=>_counterActionController.sink;

  Stream<int> get counter=>_counterActionController.stream;

  final _counterEventController=StreamController<CounterChangeEvent>.broadcast();
  Sink<CounterChangeEvent> get counterEventSink=>_counterEventController.sink;

  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterChangeEvent event){
    if(event is AddEvent)
      {
        _rootIndex+=1;
        _isCounter.add(_rootIndex);
      }
    else{
      if(_rootIndex>0)
        _rootIndex-=1;
      _isCounter.add(_rootIndex);
    }

  }

  void dispose(){
    _counterActionController.close();
    _counterEventController.close();

  }
}