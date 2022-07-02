void main(List<String> args) {
  TV tv = TV();
  Running run = TurnOn();
  tv.setState(run);

  for(int i=0;i<12;i++){
    tv.doing();
  }
}

//& Context
class TV{
  Running? run;
  void setState(Running r){
    run=r;
  }
  void doing(){
    run!.doSomething(this);
  }
}

//# State
abstract class Running{
  void doSomething(TV tv);
}

class TurnOn implements Running{
  @override
  void doSomething(TV tv) {
    print("="*29);
    print("| Вмикаємо телевізор...     |");
    tv.setState(Watching());
  }
}

class Watching implements Running{
  @override
  void doSomething(TV tv) {
    print("| Експлуатуємо телевізор... |");
    tv.setState(TurnOff());
  }
}

class TurnOff implements Running{
  @override
  void doSomething(TV tv) {
    print("| Вимикаємо телевізор!      |");
    print("="*29);
    tv.setState(TurnOn());
  }
}