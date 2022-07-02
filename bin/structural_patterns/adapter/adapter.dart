void main(List<String> args) {
  DataBase dataBase = Adapter();
  dataBase.copy();
  dataBase.remove();
  dataBase.add();
  dataBase.update();
}

abstract class DataBase{
  void copy();
  void remove();
  void update();
  void add();
}

class JavaApp{
  void replication(){
    print("Копіюються дані Java-додатку...");
  }
  void delete(){
    print("Видаляються дані Java-додатку...");
  }
  void innovate(){
    print("Оновлюються дані Java-додатку...");
  }
  void append(){
    print("Додаються нові дані Java-додатку...");
  }
}

class Adapter extends JavaApp implements DataBase{
  @override
  void add() {
    append();
  }

  @override
  void copy() {
    replication();
  }

  @override
  void remove() {
    delete();
  }

  @override
  void update() {
  innovate();
  }
}