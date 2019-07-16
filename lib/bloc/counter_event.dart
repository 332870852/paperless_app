abstract class CounterChangeEvent{}

class AddEvent extends CounterChangeEvent{
}

class DecEvent extends CounterChangeEvent{
}
///文件返回上一层
class BackEvent extends CounterChangeEvent{

}