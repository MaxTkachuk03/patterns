void main(List<String> args) {
  WorkSite work = WorkSite();
  Subscriber java = JavaDeveloper("Sergey");
  Subscriber flutter = FlutterDeveloper("Oleg");

  work.addVacancy("Junior Java developer");
  work.addVacancy("Junior Flutter developer");

  work.addSubscriber(java);
  work.addSubscriber(flutter);

  print("Перевірка!");
  work.addVacancy("Middle C++ developer"); 

  print("\nДодаємо вакансії...\n");
  
  print("${"="*52}\n");
  work.addVacancy("Senior Flutter developer");

  print("${"="*52}\n");
  work.addVacancy("Middle Java developer");

  print("${"="*52}\n");
  work.addVacancy("Junior JS developer");

  print("Перевірка!\n");
  work.removeVacancy("Middle C++ developer");

  print("Видаляємо вакансії...\n");

  print("${"="*52}\n");
  work.removeVacancy("Senior Flutter developer");
}

abstract class Publisher{
  void addSubscriber(Subscriber s);
  void removeSubscriber(Subscriber s);
  void notifySubscribers();
}

class WorkSite implements Publisher{
  List<Subscriber> subscibers = [];
  List<String> vacancies = [];

  void addVacancy(String vacancy){
    vacancies.add(vacancy);
    if(vacancy.contains("Java") || vacancy.contains("Flutter")){
      notifySubscribers();
    }
  }

  void removeVacancy(String vacancy){
    vacancies.remove(vacancy);
    if(vacancy.contains("Java") || vacancy.contains("Flutter")){
      notifySubscribers();
    }
  }

  @override
  void addSubscriber(Subscriber s) {
    subscibers.add(s);
  }

  @override
  void removeSubscriber(Subscriber s) {
    subscibers.remove(s);
  }

  @override
  void notifySubscribers() {
      for(Subscriber s in subscibers){
        s.changeNotify(vacancies);
    } 
  }
}

abstract class Subscriber{
  String name;
  Set<String> v = {};

  Subscriber(this.name);
  
  void changeNotify(List<String> vacancy) {
    for(int i=0;i<vacancy.length;i++){
      if(vacancy[i].contains(lang())){
        v.add(vacancy[i]);
      }
    }
    print("Flutter-розробник $name є зміни у списку вакансій:\n$v");
    print("-"*52);
    v.removeAll(vacancy);
  }
  String lang();
}

class JavaDeveloper extends Subscriber{
  JavaDeveloper(super.name);
  
  @override
  String lang() {
    return "Java";
  }
}

class FlutterDeveloper extends Subscriber{
  FlutterDeveloper(super.name);

  @override
  String lang() {
    return "Flutter";
  }
}