void main(List<String> args) {
  Apps app = FlutterApp();
  DataBase dataBase = Adapter(app);
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

abstract class Apps{
  void replication();
  void delete();
  void innovate();
  void append();
} 

class JavaApp extends Apps{
  @override
  void replication(){
    print("Копіюються дані Java-додатку...");
  }
  @override
  void delete(){
    print("Видаляються дані Java-додатку...");
  }
  @override
  void innovate(){
    print("Оновлюються дані Java-додатку...");
  }
  @override
  void append(){
    print("Додаються нові дані Java-додатку...");
  }
}

class FlutterApp extends Apps{
  @override
  void replication(){
    print("Копіюються дані Flutter-додатку...");
  }
  @override
  void delete(){
    print("Видаляються дані Flutter-додатку...");
  }
  @override
  void innovate(){
    print("Оновлюються дані Flutter-додатку...");
  }
  @override
  void append(){
    print("Додаються нові дані Flutter-додатку...");
  }
}

class Adapter extends DataBase{
  late Apps app;

  Adapter(this.app);

  @override
  void add() {
   app.append();
  }
  @override
  void copy() {
    app.replication();
  }
  @override
  void remove() {
    app.delete();
  }
  @override
  void update() {
    app.innovate();
  }
}