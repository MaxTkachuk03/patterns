void main(List<String> args) {
  Support support = Program(Level().error);
  Support support1 = Manager(Level().solving);
  Support support2 = Engineer(Level().succes);

  support.setNext(support1);
  support1.setNext(support2);

  support.getMessage("не може визначити проблему", Level().error);
  support.getMessage("визначає проблему, але не може вирішити її", Level().solving);
  support.getMessage("вирішує проблему. Клієнт задоволений!", Level().succes);
}

class Level{
  final int error = 1;
  final int solving = 2;
  final int succes = 3;
}

abstract class Support{
  int priority;
  
  Support(this.priority);

  Support? nextSupport;

  void setNext(Support value){
    nextSupport = value;
  }

  void getMessage(String message, int level){
    if(level==priority){
      write(message);
    }
    if(nextSupport!=null){
      nextSupport!.getMessage(message, level);
    }
  }

  void write(String message);
}

class Program extends Support{
  Program(super.priority);

  @override
  void write(String message) {
    print("Програма: $message");
  }
}

class Manager extends Support{
  Manager(super.priority);

  @override
  void write(String message) {
    print("Оператор: $message");
  }
}

class Engineer extends Support{
  Engineer(super.priority);

  @override
  void write(String message) {
    print("Інженер: $message");
  }
}