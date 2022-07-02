
void main(List<String> args) {
  Prototype orcar = Car(name: "BMW", speed: 250);
  print(orcar);
  print("\n---------------------------------\n");
  //Object newcar = orcar.clone();
  Prototype newcar = orcar.clone();
  print(newcar);
  print("\n---------------------------------\n");
  newcar = Car(name: "Tesla", speed: 300);
  print(newcar);
  print("\n---------------------------------\n");
  print(orcar);
  print("\n---------------------------------\n");
  newcar.m= "Без спойлера";
  print(orcar.m);
  print(newcar.m);
}

abstract class Prototype{
  Car clone();
  //Object clone();
  String m = "Спойлер";
}

class Car extends Prototype{
  String name;
  int speed;
  
  Car({required this.name, required this.speed});

  // @override
  // Object clone() {
  //   return Car(name: name, speed: speed);
  // }
  @override
  Car clone() {
    return Car(name: name, speed: speed);
  }
  @override
  String toString() {
    var out = "Марка машини: $name\nМаксимальна швидкість: $speed км/год";
    return out;
  }
}