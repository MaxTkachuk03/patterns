// ignore_for_file: non_constant_identifier_names

void main(List<String> args) {
  PizzaBuilder pizzaBuilder = PizzaBuilder()
  ..ChooseName("Margarita")
  ..ChooseSize(PizzaSize.big)
  ..ChooseIngrediemt(PizzaMainIgredient.tomato)
  ..ShowTime(60);
  Pizza marg = Pizza(pizzaBuilder);
  //* Pizza marg = builder.build();
  print(marg);
  
}

enum PizzaSize { small, middle, big }

enum PizzaMainIgredient { salami, pineapple, tomato, chickenfillet }

class Pizza {
  late final String name;
  late final PizzaSize size;
  late final PizzaMainIgredient igredient;
  late final int cookTime;

  Pizza(PizzaBuilder builder){
    name = builder.name;
    size = builder.size;
    igredient = builder.main;
    cookTime = builder.time;
  }

  @override
  String toString() {
    var info = '\nPizza name: $name\n';
    info += 'Size of pizza: ${size.toString().split('.')[1]}\n';
    info += "Main ingredient: ${igredient.toString().split(".")[1]}\n";
    info += "Time of cooking: $cookTime minutes\n";
    return info;
  }

  //static PizzaBuilder get builder => PizzaBuilder(); 
  
}

class PizzaBuilder {
  String _name = "Dude";
  PizzaSize _size = PizzaSize.small;
  PizzaMainIgredient _mainIgredient = PizzaMainIgredient.chickenfillet;
  int _time = 10;

  String get name => _name;
  PizzaSize get size => _size;
  PizzaMainIgredient get main => _mainIgredient;
  int get time => _time;

  void ChooseName(String n){_name=n;}
  void ChooseSize(PizzaSize s) => _size=s;
  void ChooseIngrediemt(PizzaMainIgredient mainIgredient) => _mainIgredient = mainIgredient;
  void ShowTime(int t) => _time = t;
  
  Pizza build() => Pizza(this);
}

