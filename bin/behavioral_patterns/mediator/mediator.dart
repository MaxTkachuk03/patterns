void main(List<String> args) {
  ConcreteMediator mediator = ConcreteMediator();
  Component farmer = Farm(mediator, "Оливка");
  Component superm = SuperMarket(mediator, "Варшава");

  mediator.add(farmer);
  mediator.add(superm);

  superm.getProduct("помідор");
  farmer.getProduct("помідор");
}

abstract class Component{
  void getProduct(String product);
  void setProduct(String product);
}

class SuperMarket implements Component{
  Mediator mediator;
  String name;

  SuperMarket(this.mediator, this.name);

  @override
  void getProduct(String product) {
    mediator.getProduct(product, this);
  }

  @override
  void setProduct(String product) {
    print("Магазин $name отримав продукт $product!");
  }
}

class Farm implements Component{
  Mediator mediator;
  String name;

  Farm(this.mediator, this.name);

  @override
  void getProduct(String product) {
    mediator.getProduct(product, this);
  }

  @override
  void setProduct(String product) {
    print("Ферма $name отримала замовлення продукту $product!");
  }
}

abstract class Mediator{
  void getProduct(String product,Component component);
}

class ConcreteMediator implements Mediator{
  List<Component> comps = [];

  void add(Component component){
    comps.add(component);
  }

  @override
  void getProduct(String product, Component component) {
      for(Component c in comps){
         if(c!=component){
          c.setProduct(product);
      }
    }
  }
}