void main(List<String> args) {
  Element girls = GirlsHouse();
  Element boys = BoysHouse();
  Village village = Village();
  Visitor santa = Santa();
  Visitor troll = Troll();
  
  village.addHouse(girls);
  village.addHouse(boys);
  village.addHouse(girls);
  village.addHouse(boys);
  village.addHouse(girls);

  village.accept(santa);

  print("\n${"="*102}\n");

  village.accept(troll);
}

abstract class Visitor{
  void visitGrils(GirlsHouse girls);
  void visitBoys(BoysHouse boys);
  void all();
}

//@ Concrete Visitor
class Santa implements Visitor{
  List<String> presents = [];

  @override
  void visitBoys(BoysHouse boys) {
    presents.add("Дарує машинку...");
  }

  @override
  void visitGrils(GirlsHouse girls) {
    presents.add("Дарує ляльку...");
  }

  @override
  void all() {
    print(presents);
  }
}

class Troll implements Visitor{
  List<String> presents = [];

  @override
  void visitBoys(BoysHouse boys) {
    presents.add("Викрадає машинку...");
  }

  @override
  void visitGrils(GirlsHouse girls) {
    presents.add("Викрадає ляльку...");
  }

  @override
  void all() {
    print(presents);
  }
}

abstract class Element{
  void accept(Visitor visitor);
}

//@ Concrete element
class GirlsHouse implements Element{
  @override
  void accept(Visitor visitor) {
    visitor.visitGrils(this);
  }
}

//@ Concrete element
class BoysHouse implements Element{
  @override
  void accept(Visitor visitor) {
    visitor.visitBoys(this);     
  }
}

class Village{
  List<Element> elements = [];

  void addHouse(Element element){
    elements.add(element);
  }

  void accept(Visitor visitor) {
    for(Element el in elements){
      el.accept(visitor);
    }
    visitor.all();
  }
}