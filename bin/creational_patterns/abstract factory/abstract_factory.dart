
// ignore_for_file: non_constant_identifier_names

void main(List<String> args){
/// Перший спосіб

  Costumer costumer = Costumer(CocaColaFactory());
  costumer.out();

  print("-"*40);

/// Другий спосіб
  
  AbstractFacory abstractFacory = getFac("Pepsi");
  AbstractWater water = abstractFacory.AddWater();
  AbstractBottle bottle = abstractFacory.AddBottle();
  AbstractLabel label = abstractFacory.AddLabel();
  AbstractCover cover = abstractFacory.AddCover();
  DrinkCollection collection = abstractFacory.WellDone();

  water.CreateWater();
  bottle.CreateBottle();
  label.CreateLabel();
  cover.CreateCover();
  collection.Collection();

}

AbstractFacory getFac(String product){
  switch(product){
    case "Pepsi":
        return PepsiFactory();
    case "CocaCola":
        return CocaColaFactory();
    default:
        throw "Не виготовляємо таких напоїв";
  }
}


class Costumer{

  late AbstractBottle bottle;
  late AbstractCover cover;
  late AbstractLabel label;
  late AbstractWater water;
  late DrinkCollection coll;

  Costumer (AbstractFacory factory){
    water = factory.AddWater();
    bottle = factory.AddBottle();
    label = factory.AddLabel();
    cover = factory.AddCover();
    coll = factory.WellDone();
  }

  void out(){
    water.CreateWater();
    bottle.CreateBottle();
    label.CreateLabel();
    cover.CreateCover();
    coll.Collection();
  }
}


abstract class AbstractFacory{
  AbstractWater AddWater();
  AbstractBottle AddBottle();
  AbstractLabel AddLabel();
  AbstractCover AddCover();
  DrinkCollection WellDone();
}

class CocaColaFactory implements AbstractFacory{
  @override
  AbstractBottle AddBottle() {
    return CocaColaBottle();
  }

  @override
  AbstractCover AddCover() {
   return CocaColaCover();
  }

  @override
  AbstractLabel AddLabel() {
    return CocaColaLabel();
  }

  @override
  AbstractWater AddWater() {
    return CocaColaWater();
  }
  
  @override
  DrinkCollection WellDone() {
    return CocaColaCollection();
  }
  
}

class PepsiFactory implements AbstractFacory{
  @override
  AbstractBottle AddBottle() {
    return PepsiBottle();
  }

  @override
  AbstractCover AddCover() {
    return PepsiCover();
  }

  @override
  AbstractLabel AddLabel() {
    return PepsiLabel();
  }

  @override
  AbstractWater AddWater() {
  return PepsiWater();
  }
  
  @override
  DrinkCollection WellDone() {
    return PepsiCollection();
  }
}


abstract class AbstractWater{
  void CreateWater();
}

class CocaColaWater extends AbstractWater{
  @override
  void CreateWater() {
    print("Виготовлення напою CocaCola...");
  }
}

class PepsiWater extends AbstractWater{
  @override
  void CreateWater() {
    print("Виготовлення напою Pepsi...");
  }
}


abstract class AbstractBottle{
  void CreateBottle();
}

class CocaColaBottle extends AbstractBottle{
  @override
  void CreateBottle() {
    print("Виготовлення бутилки CocaCola...");
  }
}

class PepsiBottle extends AbstractBottle{
  @override
  void CreateBottle() {
    print("Виготовлення бутилки Pepsi...");
  }
}


abstract class AbstractCover{
  void CreateCover();
}

class CocaColaCover extends AbstractCover{
  @override
  void CreateCover(){
    print("Виготовлення кришечки CocaCola...");
  }
}

class PepsiCover extends AbstractCover{
  @override
  void CreateCover() {
    print("Виготовлення кришечки Pepsi...");
  }
}


abstract class AbstractLabel{
  void CreateLabel();
}

class CocaColaLabel extends AbstractLabel{
  @override
  void CreateLabel() {
    print("Виготовлення етикетки CocaCola...");
  }
}

class PepsiLabel extends AbstractLabel{
  @override
  void CreateLabel() {
    print("Виготовлення етикетки Pepsi...");
  }
}


abstract class DrinkCollection{
  void Collection();
}

class CocaColaCollection extends DrinkCollection{
  @override
  void Collection() {
    print("Отримуємо готовий напій CocaCola!");
  }
} 

class PepsiCollection extends DrinkCollection{
  @override
  void Collection() {
    print("Отримуємо готовий напій Pepsi!");
  }

}
