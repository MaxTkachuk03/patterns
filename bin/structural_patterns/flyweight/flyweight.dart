import 'dart:math';

void main(List<String> args) {
  FlyweightFactory flyweight = FlyweightFactory();

  List<Laptop> list = [];

  
  list.add(flyweight.getPC('Lenovo'));
  list.add(flyweight.getPC('Lenovo'));
  list.add(flyweight.getPC('MacBook'));
  list.add(flyweight.getPC('Lenovo'));
  list.add(flyweight.getPC('Lenovo'));
  list.add(flyweight.getPC('MacBook'));
  list.add(flyweight.getPC('Lenovo'));
  list.add(flyweight.getPC('MacBook'));
  
  print("-"*82);
  for(Laptop laptop in list){
    int screen = Random().nextInt(24)+10;
    int number = Random().nextInt(100);
    laptop.info(screen, number);
  }
  print("-"*82);
}

abstract class Laptop{
  void info(int screen, int number);
}

class MacBook implements Laptop{
  int om = 16;

  @override
  void info(int screen, int number) {
   // ignore: prefer_adjacent_string_concatenation
   print('Ноутбук MacBook з оперативною пам\'яттю' +
   ' $om ГБ, екраном в $screen дюймів та з номером $number');
  }
}
class Lenovo implements Laptop{
  int om = 8;
  
  @override
  void info(int screen, int number) {
    // ignore: prefer_adjacent_string_concatenation
    print('Ноутбук Lenovo з оперативною пам\'яттю $om ГБ' + 
    ', екраном в $screen дюймів та з номером $number');
  }
}

class FlyweightFactory{
  Map<String, Laptop> gadgets = {};

  Laptop getPC(String name){
    Laptop? laptop = gadgets[name];
    // ignore: unnecessary_null_comparison
    if(laptop == null){
      switch (name) {
        case "Lenovo":
          print("Беремо ноутбук з Windows");
          laptop = Lenovo();
          break;
        case "MacBook":
        print("Беремо ноутбук з MacOS");
          laptop = MacBook();
          break;
        default:
          throw Error();
      }
      gadgets.addAll({name:laptop});
    }
    return laptop;
  }

}