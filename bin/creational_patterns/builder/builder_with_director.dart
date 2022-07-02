// ignore_for_file: non_constant_identifier_names

void main(List<String> args) {
  //* Вивід за вибором піци
  // Director director = Director(MargaritaPizza());
  // PizzaBuilder pizza = MargaritaPizza();
  // director.builder = pizza;
  // director.makePizza();
  // print(pizza.getPizza());

  //* Вивід всіх піц
  Director director = Director();
  for (var i in <PizzaBuilder>[MargaritaPizza(), HawaiianPizza(), SalamiPizza()]){
    director.builder = i;
    director.makePizza();
    print(i.getPizza());
    print("-"*30);
  }
  
}

enum PizzaSize { small, middle, big }

enum PizzaMainIgredient { salami, pineapple, tomato, chickenfillet }

class Pizza {
  String name;
  PizzaSize size;
  PizzaMainIgredient igredient;
  int cookTime;

  Pizza({
    this.name = "Default",
    this.size = PizzaSize.middle,
    this.igredient = PizzaMainIgredient.pineapple,
    this.cookTime = 60,
  });

  @override
  String toString() {
    var info = '\nPizza name: $name\n';
    info += 'Size of pizza: ${size.toString().split('.')[1]}\n';
    info += "Main ingredient: ${igredient.toString().split(".")[1]}\n";
    info += "Time of cooking: $cookTime minutes\n";
    return info;
  }
}

abstract class PizzaBuilder {
  void ChooseName();
  void ChooseSize();
  void ChooseIngrediemt();
  Pizza getPizza();
}

class MargaritaPizza implements PizzaBuilder {
  late Pizza pizza;

  MargaritaPizza() {
    pizza = Pizza(cookTime: 30);
  }

  @override
  void ChooseIngrediemt() {
    pizza.igredient = PizzaMainIgredient.tomato;
  }

  @override
  void ChooseName() {
    pizza.name = "Margarita";
  }

  @override
  void ChooseSize() {
    pizza.size = PizzaSize.middle;
  }

  @override
  Pizza getPizza() {
    return pizza;
  }
}

class HawaiianPizza implements PizzaBuilder {
  late Pizza _pizza;

  HawaiianPizza() {
    _pizza = Pizza(cookTime: 45);
  }

  @override
  void ChooseIngrediemt() {
    _pizza.igredient = PizzaMainIgredient.pineapple;
    _pizza.igredient = PizzaMainIgredient.chickenfillet;
  }

  @override
  void ChooseName() {
    _pizza.name = "Hawaiian";
  }

  @override
  void ChooseSize() {
    _pizza.size = PizzaSize.big;
  }

  @override
  Pizza getPizza() {
    return _pizza;
  }
}

class SalamiPizza implements PizzaBuilder {
  late Pizza pizza;

  SalamiPizza() {
    pizza = Pizza(cookTime: 15);
  }

  @override
  void ChooseIngrediemt() {
    pizza.igredient = PizzaMainIgredient.salami;
  }

  @override
  void ChooseName() {
    pizza.name = "Salami";
  }

  @override
  void ChooseSize() {
    pizza.size = PizzaSize.small;
  }

  @override
  Pizza getPizza() {
    return pizza;
  }
}

class Director{
  PizzaBuilder? _builder;
  
  Director([this._builder]);

  set builder(PizzaBuilder builder){
    _builder = builder;
  }

  void makePizza(){
    if(_builder != null){
    _builder?.ChooseName();
    _builder?.ChooseSize();
    _builder?.ChooseIngrediemt();
    }
    else{
      throw Error();
    }
  }

}