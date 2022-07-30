void main(List<String> args) {
  SingletonSpace space  = SingletonSpace();
  print(space);
  print("-"*15);
  space.planet = "Pluto";
  SingletonSpace newspace = SingletonSpace();
  print(newspace);
  print("-"*15);
  print(identical(space, newspace));
}

class SingletonSpace{
  static SingletonSpace? _inst;

  String star = "Sun";
  String planet = "Earth";

  SingletonSpace._();

  factory SingletonSpace(){
    return _inst ??= SingletonSpace._();
  }

  @override
  String toString() {
    return "Зірка: $star\nПланета: $planet";
  }
}