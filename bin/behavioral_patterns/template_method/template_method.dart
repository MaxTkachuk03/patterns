void main(List<String> args) {
  RezumeList list = SimpleRezumeList();

  list.addRezume("Антон");
  list.addRezume("Валерій");
  list.addRezume("Ігор");
  list.addRezume("Максим");
  
  list.show();

  print("="*50);

  RezumeList list2 = SortRezumeList();

  list2.addRezume("Олександр");
  list2.addRezume("Антон");
  list2.addRezume("Валерій");
  list2.addRezume("Ігор");
  list2.addRezume("Михайло");

  list2.show();

  print("="*50);

  print("Після видалення елементів....");

  list2.deleteRezume("Валерій");
  list.deleteRezume("Ігор");

  list2.show();

  print("="*50);

  list.show();
}

abstract class RezumeList{
  List<String> rez = [];

  void addRezume(String name){
    rez.add(name);
  }
  void deleteRezume(String del){
    rez.remove(del);
  }
  void show(){
    list();
    print(rez);
  }
  void list();
}
class SimpleRezumeList extends RezumeList{
  @override
  void list() {
    print("Невідсортований список: ");
  }
}

class SortRezumeList extends RezumeList{
  @override
  void list() {
    rez.sort();
    print("Відсортований список: ");
  }
}